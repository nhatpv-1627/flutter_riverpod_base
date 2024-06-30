import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/src/presentation/navigation/screens.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(Screens.topRatedMovie)) {
      return 0;
    }
    if (location.startsWith(Screens.favoriteMovies)) {
      return 1;
    }
    if (location.startsWith(Screens.myProfile)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(Screens.topRatedMovie);
        break;
      case 1:
        GoRouter.of(context).go(Screens.favoriteMovies);
        break;
      case 2:
        GoRouter.of(context).go(Screens.myProfile);
        break;
    }
  }
}
