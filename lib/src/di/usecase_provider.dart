import 'package:flutter_base/src/di/repository_provider.dart';
import 'package:flutter_base/src/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getTopRatedMoviesUseCaseProvider = Provider<GetTopRatedMoviesUseCase>(
  (ref) => GetTopRatedMoviesUseCase(ref.watch(movieRepositoryProvider)),
);
