import 'package:flutter_base/src/di/repository_provider.dart';
import 'package:flutter_base/src/domain/usecase/get_movie_detail_usecase.dart';
import 'package:flutter_base/src/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:flutter_base/src/domain/usecase/get_popular_movies_usecase.dart';
import 'package:flutter_base/src/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:flutter_base/src/domain/usecase/login_usecase.dart';
import 'package:flutter_base/src/domain/usecase/logout_usecase.dart';
import 'package:flutter_base/src/domain/usecase/search_movies_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
GetTopRatedMoviesUseCase getTopRatedMoviesUseCase(
    GetTopRatedMoviesUseCaseRef ref) {
  return GetTopRatedMoviesUseCase(ref.watch(movieRepositoryProvider));
}

@riverpod
GetMovieDetailUsecase getMovieDetailUseCase(GetMovieDetailUseCaseRef ref) {
  return GetMovieDetailUsecase(ref.watch(movieRepositoryProvider));
}

@riverpod
GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase(
    GetNowPlayingMoviesUseCaseRef ref) {
  return GetNowPlayingMoviesUseCase(ref.watch(movieRepositoryProvider));
}

@riverpod
GetPopularMoviesUseCase getPopularMoviesUseCase(
    GetPopularMoviesUseCaseRef ref) {
  return GetPopularMoviesUseCase(ref.watch(movieRepositoryProvider));
}

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
SearchMoviesUseCase searchMoviesUseCase(SearchMoviesUseCaseRef ref) {
  return SearchMoviesUseCase(ref.watch(movieRepositoryProvider));
}

@riverpod
LogoutUsecase logoutUseCase(LogoutUseCaseRef ref) {
  return LogoutUsecase(ref.watch(authRepositoryProvider));
}
