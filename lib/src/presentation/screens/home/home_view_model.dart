import 'package:flutter_base/src/di/usecase_provider.dart';
import 'package:flutter_base/src/domain/models/list_model.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:flutter_base/src/domain/usecase/get_popular_movies_usecase.dart';
import 'package:flutter_base/src/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/screens/home/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    state = HomeState();
    getBanners();
    getPopularMovies();
    getTopRatedMovies();
    return state;
  }

  Future refresh() async {
    await Future.wait([
      getBanners(status: ProcessStatus.refreshing),
      getPopularMovies(status: ProcessStatus.refreshing),
      getTopRatedMovies(status: ProcessStatus.refreshing),
    ]);
  }

  Future<void> getTopRatedMovies(
      {ProcessStatus status = ProcessStatus.loading}) async {
    final getTopRatedMoviesUseCase =
        ref.watch(getTopRatedMoviesUseCaseProvider);
    final input = GetTopRatedInput(1);
    try {
      state = state.copyWith(status: status);
      final ListModel<MovieModel> data = await getTopRatedMoviesUseCase(input);
      state = state.copyWith(
        status: ProcessStatus.success,
        topRatedMovies: data.results,
      );
    } catch (error) {
      state = state.copyWith(status: ProcessStatus.failure, error: error);
    }
  }

  Future<void> getBanners(
      {ProcessStatus status = ProcessStatus.loading}) async {
    final useCase = ref.watch(getNowPlayingMoviesUseCaseProvider);
    final input = GetNowPlayingInput(1);
    try {
      state = state.copyWith(status: status);
      final ListModel<MovieModel> data = await useCase(input);
      state = state.copyWith(
        status: ProcessStatus.success,
        banners: data.results,
      );
    } catch (error) {
      state = state.copyWith(status: ProcessStatus.failure, error: error);
    }
  }

  Future<void> getPopularMovies(
      {ProcessStatus status = ProcessStatus.loading}) async {
    final useCase = ref.watch(getPopularMoviesUseCaseProvider);
    final input = GetPopularInput(1);
    try {
      state = state.copyWith(status: status);
      final ListModel<MovieModel> data = await useCase(input);
      state = state.copyWith(
        status: ProcessStatus.success,
        popularMovies: data.results,
      );
    } catch (error) {
      state = state.copyWith(status: ProcessStatus.failure, error: error);
    }
  }
}
