import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/navigation/nav_params.dart';
import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/screens/search/components/movie_item.dart';
import 'package:flutter_base/src/presentation/screens/search/search_movies_view_model.dart';
import 'package:flutter_base/src/presentation/widgets/loading.dart';
import 'package:flutter_base/src/shared/error/error_handler.dart';
import 'package:flutter_base/src/shared/extensions/list_exts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchMoviePage extends HookConsumerWidget {
  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(searchMoviesViewModelProvider);
    final scrollController = useScrollController();
    final TextEditingController searchTextController =
        useTextEditingController();
    final debounceTimer = useState<Timer?>(null);

    ref.listen(searchMoviesViewModelProvider.select((state) => state.error),
        (previous, next) {
      handleError(context, ref, next);
    });

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          bool isBottom = scrollController.position.pixels ==
              scrollController.position.maxScrollExtent;
          if (isBottom) {
            ref
                .read(searchMoviesViewModelProvider.notifier)
                .searchMovies(status: ProcessStatus.loadingMore);
          }
        }
      });

      return () => scrollController.dispose();
    }, [scrollController]);

    void onTextChanged(String query) {
      debounceTimer.value?.cancel();
      debounceTimer.value = Timer(const Duration(milliseconds: 300), () {
        viewModel.nextPage = 1;
        viewModel.query = query;
        ref.read(searchMoviesViewModelProvider.notifier).searchMovies();
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                viewModel.nextPage = 1;
                return await ref
                    .watch(searchMoviesViewModelProvider.notifier)
                    .searchMovies(status: ProcessStatus.refreshing);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchTextController,
                      onChanged: onTextChanged,
                      onTapOutside: (PointerDownEvent event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.search_dot.tr(),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: viewModel.movies.isNullOrEmpty() &&
                            !viewModel.status.isLoading
                        ? Center(
                            child: Text(LocaleKeys.empty.tr()),
                          )
                        : ListView.builder(
                            controller: scrollController,
                            itemCount: viewModel.movies?.length ?? 0,
                            itemBuilder: (_, index) {
                              return MovieItem(
                                movie: viewModel.movies![index],
                                onItemTap: (value) {
                                  context.pushNamed(
                                    ScreenNames.searchMovieDetail,
                                    pathParameters: {
                                      NavParams.movieId: '$value'
                                    },
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            if (viewModel.status.isLoading) const Loading(),
          ],
        ),
      ),
    );
  }
}
