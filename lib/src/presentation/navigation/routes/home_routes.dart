import 'package:flutter/widgets.dart';
import 'package:flutter_base/src/presentation/navigation/nav_params.dart';
import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/navigation/screen_paths.dart';
import 'package:flutter_base/src/presentation/screens/movie_detail/movie_detail_page.dart';
import 'package:go_router/go_router.dart';

final homeRoutes = <RouteBase>[
  GoRoute(
    name: ScreenNames.homeMovieDetail,
    path: ScreenPaths.movieDetail,
    builder: (BuildContext context, GoRouterState state) {
      return MovieDetailPage(
        movieId: int.parse(state.pathParameters[NavParams.movieId]!),
      );
    },
  ),
  // TODO add more...
];
