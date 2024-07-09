import 'package:flutter_base/config/environment.dart';
import 'package:flutter_base/src/data/auth_repository_impl.dart';
import 'package:flutter_base/src/data/movie_repository_impl.dart';
import 'package:flutter_base/src/data/remote/auth_remote_data_source.dart';
import 'package:flutter_base/src/data/remote/movie_remote_data_source.dart';
import 'package:flutter_base/src/di/local_provider.dart';
import 'package:flutter_base/src/di/mapper_provider.dart';
import 'package:flutter_base/src/di/network_provider.dart';
import 'package:flutter_base/src/domain/repository/auth_repository.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource();
}

@Riverpod(keepAlive: true)
MovieRemoteDataSource movieRemoteDataSource(MovieRemoteDataSourceRef ref) {
  return MovieRemoteDataSource(
    authApi: ref.watch(authApiProvider),
    apiKey: Environment.apiKey,
    unAuthApi: ref.watch(unAuthApiProvider),
  );
}

@Riverpod(keepAlive: true)
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepositoryImpl(
    ref.watch(movieRemoteDataSourceProvider),
    ref.watch(movieMapperProvider),
  );
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    authRemoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(localDataSourceProvider),
  );
}
