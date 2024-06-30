import 'package:flutter/material.dart';
import 'package:flutter_base/src/di/viewmodel_provider.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/presentation/navigation/screens.dart';
import 'package:flutter_base/src/presentation/utils/widgets/loading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContentWidget extends HookConsumerWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(topRatedMoviesViewModelProvider);
    final movieState = viewModel.movieListState.value;
    final hasLoading =
        viewModel.processes.any((element) => element.value is AsyncLoading);
    return Stack(
      children: [
        movieState?.whenOrNull(
              data: (data) => _listMovies(data),
            ) ??
            const SizedBox(),
        if (hasLoading) const Loading(),
      ],
    );
  }

  Widget _listMovies(List<MovieModel>? movies) {
    return movies == null || movies.isEmpty == true
        ? const Center(child: Text('<Empty>'))
        : ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _buildMovieItem(context, movies[index]);
            },
            separatorBuilder: (context, index) => const Divider(thickness: 1.5),
            itemCount: movies.length,
          );
  }
}

Widget _buildMovieItem(BuildContext context, MovieModel movie) {
  return InkWell(
    onTap: () {
      // TODO navigation: https://pub.dev/documentation/go_router/latest/topics/Navigation-topic.html
      GoRouter.of(context)
          .go('${Screens.topRatedMovie}/${Screens.movieDetail}');
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(movie.backdropPath),
          Text(movie.title),
        ],
      ),
    ),
  );
}
