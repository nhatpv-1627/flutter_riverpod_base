import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/screens/my_profile/profile_state.dart';
import 'package:flutter_base/src/presentation/screens/my_profile/profile_view_model.dart';
import 'package:flutter_base/src/presentation/widgets/my_network_image.dart';
import 'package:flutter_base/src/shared/extensions/context_exts.dart';
import 'package:flutter_base/src/shared/global_state/auth_state.dart';
import 'package:flutter_base/src/shared/global_state/user_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateProvider);
    ref.listen<ProfileState>(profileViewModelProvider, (_, next) {
      if (next.status.isLoading) {
        ref.read(currentAuthStateProvider.notifier).invalidate();
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: MyNetworkImage(
                        width: 100,
                        height: 100,
                        url: user.avatar ?? '',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.name ?? '',
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.email ?? '',
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(LocaleKeys.settings).tr(),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.pushNamed(ScreenNames.settings);
                },
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(LocaleKeys.logout).tr(),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(LocaleKeys.logout).tr(),
                        content: Text(LocaleKeys.confirm_logout.tr()),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(LocaleKeys.cancel.tr()),
                          ),
                          TextButton(
                            onPressed: () {
                              context.pop();
                              ref
                                  .read(profileViewModelProvider.notifier)
                                  .logout();
                            },
                            child: Text(LocaleKeys.logout.tr()),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
