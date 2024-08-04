import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/navigation/nav_params.dart';
import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/screens/home/components/corousel_item.dart';
import 'package:flutter_base/src/presentation/screens/home/components/top_rated_movie_item.dart';
import 'package:flutter_base/src/presentation/screens/home/home_view_model.dart';
import 'package:flutter_base/src/presentation/screens/search/components/movie_item.dart';
import 'package:flutter_base/src/presentation/widgets/loading.dart';
import 'package:flutter_base/src/shared/error/error_handler.dart';
import 'package:flutter_base/src/shared/extensions/list_exts.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(homeViewModelProvider.select((state) => state.error),
        (previous, next) {
      handleError(context, ref, next);
    });
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                await ref.read(homeViewModelProvider.notifier).refresh();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCarousel(),
                    const SizedBox(height: 20),
                    _buildTitle(LocaleKeys.english.tr()),
                    const SizedBox(height: 10),
                    _buildTopRatedList(),
                    const SizedBox(height: 20),
                    _buildTitle(LocaleKeys.english.tr()),
                    const SizedBox(height: 10),
                    _buildPopularList(),
                  ],
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final status = ref.watch(
                  homeViewModelProvider.select((selector) => selector.status),
                );
                return status.isLoading == true
                    ? const Loading()
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return Consumer(
      builder: (context, ref, child) {
        final banners = ref.watch(
          homeViewModelProvider.select((selector) => selector.banners),
        );
        final items = banners
                ?.map(
                  (e) => CarouselItem(
                    movie: e,
                    onItemTap: (value) {
                      context.pushNamed(
                        ScreenNames.homeMovieDetail,
                        pathParameters: {NavParams.movieId: '${e.id}'},
                      );
                    },
                  ),
                )
                .toList() ??
            [];
        return items.isNullOrEmpty()
            ? const SizedBox(height: 200)
            : CarouselSlider(
                items: items,
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              );
      },
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTopRatedList() {
    return Consumer(builder: (context, ref, child) {
      final movies = ref
          .watch(
            homeViewModelProvider.select((selector) => selector.topRatedMovies),
          )
          .orEmpty()
          .toList();
      return SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return TopRatedMovieItem(
              onItemTap: (value) {
                context.pushNamed(
                  ScreenNames.homeMovieDetail,
                  pathParameters: {NavParams.movieId: '$value'},
                );
              },
              movie: movies[index],
            );
          },
        ),
      );
    });
  }

  Widget _buildPopularList() {
    return Consumer(builder: (context, ref, child) {
      final movies = ref
          .watch(
            homeViewModelProvider.select((selector) => selector.popularMovies),
          )
          .orEmpty()
          .toList();
      return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieItem(
            onItemTap: (value) {
              context.pushNamed(
                ScreenNames.homeMovieDetail,
                pathParameters: {NavParams.movieId: '$value'},
              );
            },
            movie: movies[index],
          );
        },
      );
    });
  }
}
