import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/ui/favorite_movies/favorite_movie_page.dart';
import 'package:flutter_base/src/presentation/ui/my_profile/my_profile_page.dart';
import 'package:go_router/go_router.dart';

import '/src/presentation/navigation/screens.dart';
import '/src/presentation/ui/home/home_page.dart';
import '/src/presentation/ui/login/login_page.dart';
import '/src/presentation/ui/movie_detail/movie_detail_page.dart';
import '/src/presentation/ui/top_rate_movies/top_rated_movies_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: Screens.topRatedMovie,
  routes: [
    GoRoute(
      path: Screens.login,
      builder: (context, state) => const LoginPage(),
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
);

final topRatedMoviesStack = StatefulShellBranch(
  routes: <RouteBase>[
    GoRoute(
      path: Screens.topRatedMovie,
      builder: (BuildContext context, GoRouterState state) {
        return const TopRatedMoviePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Screens.movieDetail,
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
      path: Screens.favoriteMovies,
      builder: (BuildContext context, GoRouterState state) {
        return const FavoriteMoviesPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Screens.movieDetail,
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
      path: Screens.myProfile,
      builder: (BuildContext context, GoRouterState state) {
        return const MyProfilePage();
      },
    ),
  ],
);
