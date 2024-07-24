import 'package:flutter/material.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/screens/top_rate_movies/top_rated_movies_view_model.dart';
import 'package:flutter_base/src/shared/extensions/list_exts.dart';
import 'package:flutter_base/src/shared/widgets/loading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContentWidget extends HookConsumerWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(topRatedMoviesViewModelProvider);
    return Stack(
      children: [
        viewModel.movies.isNullOrEmpty()
            ? const Center(
                child: Text('Empty'),
              )
            : _listMovies(viewModel.movies),
        if (viewModel.status.isLoading) const Loading(),
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
      context.pushNamed(ScreenNames.topMovieDetail);
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
