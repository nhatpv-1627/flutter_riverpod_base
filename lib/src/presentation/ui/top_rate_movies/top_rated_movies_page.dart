import 'package:flutter/material.dart';
import 'package:flutter_base/src/di/viewmodel_provider.dart';
import 'package:flutter_base/src/presentation/ui/top_rate_movies/components/content.dart';
import 'package:flutter_base/src/presentation/utils/common_ext.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopRatedMoviePage extends HookConsumerWidget {
  const TopRatedMoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(topRatedMoviesViewModelProvider);
    viewModel.getTopRatedMovies();
    ref.listen(topRatedMoviesViewModelProvider, (previous, next) {
      next.movieListState.value?.showSnackBarOnError(context);
    });
    return const Scaffold(
      body: ContentWidget(),
    );
  }
}
