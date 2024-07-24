import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/screens/top_rate_movies/components/content.dart';
import 'package:flutter_base/src/presentation/screens/top_rate_movies/top_rated_movies_view_model.dart';
import 'package:flutter_base/src/shared/functions/common_funs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopRatedMoviePage extends HookConsumerWidget {
  const TopRatedMoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(topRatedMoviesViewModelProvider.select((state) => state.error),
        (previous, next) {
      if (next == null) return;
      showSnackBar(context, next.toString());
    });
    return const Scaffold(
      body: ContentWidget(),
    );
  }
}
