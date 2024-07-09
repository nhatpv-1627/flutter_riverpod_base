import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final themeMode = ref.watch(currentThemeModeProvider);

    void onTapThemeMode() => showDialog(
          context: context,
          builder: (_) => const _ThemeModeDialog(),
        );

    // void onTapLicenses() => context.showAppLicensePage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme mode'),
            // trailing: Text(themeMode.label),
            onTap: onTapThemeMode,
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Licenses'),
            // onTap: onTapLicenses,
          ),
        ],
      ),
    );
  }
}

class _ThemeModeDialog extends ConsumerWidget {
  const _ThemeModeDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTapOption(ThemeMode themeMode) {
      // ref.read(currentThemeModeProvider.notifier).set(themeMode);
      Navigator.of(context).pop();
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
      // title: Text(value.label),
    );
  }
}
