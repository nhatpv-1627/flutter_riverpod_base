import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/navigation/routes/global_routes.dart';
import 'package:flutter_base/src/presentation/navigation/routes/profile_routes.dart';
import 'package:flutter_base/src/presentation/navigation/routes/search_routes.dart';
import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/screens/home/home_page.dart';
import 'package:flutter_base/src/presentation/screens/my_profile/my_profile_page.dart';
import 'package:flutter_base/src/presentation/screens/search/search_movies_page.dart';
import 'package:flutter_base/src/presentation/widgets/bottom_navigation.dart';
import 'package:flutter_base/src/shared/global_state/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes/home_routes.dart';
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

  final homeStack = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: ScreenNames.home,
        path: ScreenPaths.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: homeRoutes,
      ),
    ],
  );

  final searchMoviesStack = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: ScreenNames.searchMovies,
        path: ScreenPaths.searchMovies,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchMoviePage();
        },
        routes: searchRoutes,
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
        routes: profileRoutes,
      ),
    ],
  );

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: ScreenPaths.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return BottomNavigation(child: child);
        },
        branches: <StatefulShellBranch>[
          homeStack,
          searchMoviesStack,
          myProfileStack,
        ],
      ),
      ...globalRoutes,
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
