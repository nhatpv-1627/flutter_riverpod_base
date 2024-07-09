import 'package:flutter_base/src/di/repository_provider.dart';
import 'package:flutter_base/src/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:flutter_base/src/domain/usecase/login_usecase.dart';
import 'package:flutter_base/src/domain/usecase/logout_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
GetTopRatedMoviesUseCase getTopRatedMoviesUseCase(
    GetTopRatedMoviesUseCaseRef ref) {
  return GetTopRatedMoviesUseCase(ref.watch(movieRepositoryProvider));
}

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
LogoutUsecase logoutUseCase(LogoutUseCaseRef ref) {
  return LogoutUsecase(ref.watch(authRepositoryProvider));
}
