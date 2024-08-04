import 'package:flutter_base/src/di/usecase_provider.dart';
import 'package:flutter_base/src/domain/models/list_model.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/usecase/search_movies_usecase.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/screens/search/search_movies_state.dart';
import 'package:flutter_base/src/shared/extensions/common_exts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_view_model.g.dart';

@riverpod
class SearchMoviesViewModel extends _$SearchMoviesViewModel {
  @override
  SearchMoviesState build() {
    state = SearchMoviesState(
      nextPage: 1,
      status: ProcessStatus.initial,
    );
    searchMovies();
    return state;
  }

  Future<void> searchMovies(
      {ProcessStatus status = ProcessStatus.loading}) async {
    final usecase = ref.watch(searchMoviesUseCaseProvider);
    final input = SearchMoviesInput(state.nextPage ?? 1, state.query);
    try {
      state = state.copyWith(status: status);
      if (state.nextPage == -1) {
        state = state.copyWith(status: ProcessStatus.success);
        return;
      }
      final ListModel<MovieModel> data = await usecase(input);
      var newList = state.movies;

      if (status == ProcessStatus.loadingMore) {
        newList?.addAll(data.results ?? []);
      } else {
        newList = data.results;
      }

      state = state.copyWith(
        status: ProcessStatus.success,
        movies: newList,
        nextPage: state.nextPage.orDefault(1) >= data.totalPages.orDefault(1)
            ? -1
            : state.nextPage.orDefault(1) + 1,
      );
    } catch (error) {
      state = state.copyWith(status: ProcessStatus.failure, error: error);
    }
  }
}
