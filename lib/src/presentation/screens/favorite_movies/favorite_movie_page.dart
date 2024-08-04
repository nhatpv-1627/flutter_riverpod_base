import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteMoviesPage extends ConsumerWidget {
  const FavoriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Text("FavoriteMoviesPage"),
              )
            ],
          )
        ],
      ),
    );
  }
}
