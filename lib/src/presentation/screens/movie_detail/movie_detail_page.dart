import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/domain/models/movie_detail_model.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/screens/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_base/src/presentation/widgets/loading.dart';
import 'package:flutter_base/src/presentation/widgets/my_network_image.dart';
import 'package:flutter_base/src/shared/error/error_handler.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieDetailPage extends ConsumerWidget {
  const MovieDetailPage({required this.movieId, super.key});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
        movieDetailViewModelProvider(movieId).select((state) => state.error),
        (previous, next) {
      handleError(context, ref, next);
    });
    final MovieDetailModel? movieDetail =
        ref.watch(movieDetailViewModelProvider(movieId)).movie;
    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              return await ref
                  .watch(movieDetailViewModelProvider(movieId).notifier)
                  .getMovieDetail(movieId: movieId);
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      MyNetworkImage(
                        url: movieDetail?.backdropPath ?? '',
                        height: 350,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: MyNetworkImage(
                                url: movieDetail?.backdropPath ?? '',
                                width: 100,
                                height: 150,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    movieDetail?.title ?? '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  _buildGenre(movieDetail),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 24,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${movieDetail?.voteAverage} / 10',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              LocaleKeys.release_date,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ).tr(args: [movieDetail?.releaseDate ?? '']),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          movieDetail?.overview ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        if (movieDetail?.belongsToCollection != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Collection',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  MyNetworkImage(
                                    url: movieDetail
                                            ?.belongsToCollection?.posterPath ??
                                        '',
                                    width: 80,
                                    height: 120,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      movieDetail?.belongsToCollection?.name ??
                                          '',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 40,
            child: BackButton(
              onPressed: () {
                context.pop();
              },
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final status = ref.watch(
                movieDetailViewModelProvider(movieId)
                    .select((selector) => selector.status),
              );
              return status.isLoading == true
                  ? const Loading()
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGenre(MovieDetailModel? movieDetail) {
    if (movieDetail?.genres == null) {
      return const SizedBox.shrink();
    }
    final list = movieDetail!.genres!.length > 2
        ? movieDetail.genres!.sublist(0, 2)
        : movieDetail.genres!;
    final genres = list
        .map((genre) => Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
              ),
              child: Chip(
                backgroundColor: Colors.black54,
                label: Text(
                  genre.name ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ))
        .toList();
    return Row(children: [
      ...genres,
      const SizedBox(
        width: 10,
      )
    ]);
  }
}
