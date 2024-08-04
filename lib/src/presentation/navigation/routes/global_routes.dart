import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/navigation/screen_paths.dart';
import 'package:flutter_base/src/presentation/screens/login/login_page.dart';
import 'package:flutter_base/src/presentation/screens/settings/settings_page.dart';
import 'package:go_router/go_router.dart';

final globalRoutes = <RouteBase>[
  GoRoute(
    name: ScreenNames.login,
    path: ScreenPaths.login,
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(
    name: ScreenNames.settings,
    path: ScreenPaths.settings,
    builder: (context, state) => const SettingsPage(),
  ),
];
