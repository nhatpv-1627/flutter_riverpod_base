import 'package:flutter_base/config/environment.dart';
import 'package:flutter_base/src/data/movie_repository_impl.dart';
import 'package:flutter_base/src/data/remote/movie_remote_data_source.dart';
import 'package:flutter_base/src/di/mapper_provider.dart';
import 'package:flutter_base/src/di/network_provider.dart';
import 'package:flutter_base/src/domain/repository/movie_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieRemoteDataSource = Provider<MovieRemoteDataSource>(
  (ref) => MovieRemoteDataSource(
    authApi: ref.watch(authApiProvider),
    apiKey: Environment.apiKey,
    unAuthApi: ref.watch(unauthApiProvider),
  ),
);

final movieRepositoryProvider = Provider<MovieRepository>(
  (ref) => MovieRepositoryImpl(
    ref.watch(movieRemoteDataSource),
    ref.watch(movieMapper),
  ),
);
