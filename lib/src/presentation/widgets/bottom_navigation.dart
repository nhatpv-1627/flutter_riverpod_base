import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/presentation/navigation/screen_paths.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: LocaleKeys.home.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: LocaleKeys.search.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: LocaleKeys.profile.tr(),
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(ScreenPaths.home)) {
      return 0;
    }
    if (location.startsWith(ScreenPaths.searchMovies)) {
      return 1;
    }
    if (location.startsWith(ScreenPaths.myProfile)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(ScreenPaths.home);
        break;
      case 1:
        GoRouter.of(context).go(ScreenPaths.searchMovies);
        break;
      case 2:
        GoRouter.of(context).go(ScreenPaths.myProfile);
        break;
    }
  }
}
