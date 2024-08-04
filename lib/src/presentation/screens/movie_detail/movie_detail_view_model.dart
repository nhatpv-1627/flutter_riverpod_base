import 'package:flutter_base/src/di/usecase_provider.dart';
import 'package:flutter_base/src/domain/models/movie_detail_model.dart';
import 'package:flutter_base/src/domain/usecase/get_movie_detail_usecase.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/screens/movie_detail/movie_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_view_model.g.dart';

@riverpod
class MovieDetailViewModel extends _$MovieDetailViewModel {
  @override
  MovieDetailState build(int movieId) {
    state = MovieDetailState(
      status: ProcessStatus.loading,
    );
    getMovieDetail(movieId: movieId);
    return state;
  }

  Future<void> getMovieDetail(
      {required int movieId,
      ProcessStatus status = ProcessStatus.loading}) async {
    final useCase = ref.watch(getMovieDetailUseCaseProvider);
    final input = GetMovieDetailInput(movieId);
    try {
      final MovieDetailModel data = await useCase(input);
      state = state.copyWith(
        status: ProcessStatus.success,
        movie: data,
      );
    } catch (error) {
      state = state.copyWith(status: ProcessStatus.failure, error: error);
    }
  }
}
