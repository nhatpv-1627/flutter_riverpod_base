import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/ui/favorite_movies/favorite_movie_page.dart';
import 'package:flutter_base/src/presentation/ui/my_profile/my_profile_page.dart';
import 'package:flutter_base/src/presentation/ui/settings/settings.dart';
import 'package:flutter_base/src/shared/global_state/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/src/presentation/ui/home/home_page.dart';
import '/src/presentation/ui/login/login_page.dart';
import '/src/presentation/ui/movie_detail/movie_detail_page.dart';
import '/src/presentation/ui/top_rate_movies/top_rated_movies_page.dart';
import 'screen_paths.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter router(RouterRef ref) {
  final authStateNotifier = ValueNotifier(AuthState.unknown);
  ref
    ..onDispose(authStateNotifier.dispose)
    ..listen(
      currentAuthStateProvider,
      (_, value) {
        authStateNotifier.value = value;
      },
    );

  final topRatedMoviesStack = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: ScreenNames.topRatedMovie,
        path: ScreenPaths.topRatedMovie,
        builder: (BuildContext context, GoRouterState state) {
          return const TopRatedMoviePage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: ScreenNames.topMovieDetail,
            path: ScreenPaths.movieDetail,
            builder: (BuildContext context, GoRouterState state) {
              return const MovieDetailPage();
            },
          ),
        ],
      ),
    ],
  );

  final favoriteMoviesStack = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: ScreenNames.favoriteMovies,
        path: ScreenPaths.favoriteMovies,
        builder: (BuildContext context, GoRouterState state) {
          return const FavoriteMoviesPage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: ScreenNames.favoriteMovieDetail,
            path: ScreenPaths.movieDetail,
            builder: (BuildContext context, GoRouterState state) {
              return const MovieDetailPage();
            },
          ),
        ],
      ),
    ],
  );

  final myProfileStack = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: ScreenNames.myProfile,
        path: ScreenPaths.myProfile,
        builder: (BuildContext context, GoRouterState state) {
          return const MyProfilePage();
        },
      ),
    ],
  );

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: ScreenPaths.topRatedMovie,
    routes: [
      GoRoute(
        name: ScreenNames.login,
        path: ScreenPaths.login,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: ScreenNames.settings,
        path: ScreenPaths.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return HomePage(child: child);
        },
        branches: <StatefulShellBranch>[
          topRatedMoviesStack,
          favoriteMoviesStack,
          myProfileStack,
        ],
      ),
    ],
    refreshListenable: authStateNotifier,
    redirect: (_, state) {
      // Get the current auth state.
      final authState = ref.read(currentAuthStateProvider);

      // Check if the current path is allowed for the current auth state. If not,
      // redirect to the redirect target of the current auth state.
      if (!authState.allowedPaths.contains(state.fullPath)) {
        return authState.redirectPath;
      }

      // If the current path is allowed for the current auth state, don't redirect.
      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
}
