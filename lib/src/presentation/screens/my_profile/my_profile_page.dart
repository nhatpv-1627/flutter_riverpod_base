import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/screens/my_profile/profile_state.dart';
import 'package:flutter_base/src/presentation/screens/my_profile/profile_view_model.dart';
import 'package:flutter_base/src/shared/global_state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ProfileState>(profileViewModelProvider, (_, next) {
      if (next.status.isLoading) {
        ref.read(currentAuthStateProvider.notifier).invalidate();
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.read(profileViewModelProvider.notifier).logout();
                },
                child: const Text("Logout")),
          )
        ],
      ),
    );
  }
}
