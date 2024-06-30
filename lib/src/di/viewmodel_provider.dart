import 'package:flutter_base/src/di/usecase_provider.dart';
import 'package:flutter_base/src/presentation/ui/top_rate_movies/top_rated_movies_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final topRatedMoviesViewModelProvider =
    ChangeNotifierProvider.autoDispose<TopRatedMoviesViewModel>(
  (ref) => TopRatedMoviesViewModel(
    ref.watch(getTopRatedMoviesUseCaseProvider),
  ),
);
