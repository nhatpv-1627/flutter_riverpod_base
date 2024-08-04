import 'package:flutter/material.dart';
import 'package:flutter_base/src/shared/extensions/common_exts.dart';
import 'package:flutter_base/src/shared/global_state/theme_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModeDialog extends ConsumerWidget {
  const ThemeModeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTapOption(ThemeMode themeMode) {
      ref.read(currentThemeModeProvider.notifier).set(themeMode);
      context.pop();
    }

    return SimpleDialog(
      clipBehavior: Clip.antiAlias,
      children: [
        for (final themeMode in ThemeMode.values)
          _ThemeModeDialogOption(
            value: themeMode,
            onTap: () => onTapOption(themeMode),
          )
      ],
    );
  }
}

class _ThemeModeDialogOption extends StatelessWidget {
  const _ThemeModeDialogOption({required this.value, required this.onTap});

  final ThemeMode value;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(value.label),
    );
  }
}
