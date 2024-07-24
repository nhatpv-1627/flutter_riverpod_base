import 'package:flutter_base/src/di/usecase_provider.dart';
import 'package:flutter_base/src/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/screens/top_rate_movies/top_movies_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_rated_movies_view_model.g.dart';

@riverpod
class TopRatedMoviesViewModel extends _$TopRatedMoviesViewModel {
  @override
  TopMoviesState build() {
    state = TopMoviesState(
      currentPage: 1,
      status: ProcessStatus.loading,
    );
    getMovies();
    return state;
  }

  Future<void> getMovies() async {
    final getTopRatedMoviesUseCase =
        ref.watch(getTopRatedMoviesUseCaseProvider);

    final input = GetTopRaredInput(state.currentPage ?? 1);
    try {
      state = state.copyWith(status: ProcessStatus.loading);
      final result = await getTopRatedMoviesUseCase(input);
      state = state.copyWith(status: ProcessStatus.success, movies: result);
    } catch (error) {
      state = state.copyWith(status: ProcessStatus.failure, error: error);
    }
  }
}
