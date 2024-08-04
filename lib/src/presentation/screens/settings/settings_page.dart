import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/presentation/screens/settings/components/select_language_dialog.dart';
import 'package:flutter_base/src/presentation/screens/settings/components/theme_mode_dialog.dart';
import 'package:flutter_base/src/shared/extensions/common_exts.dart';
import 'package:flutter_base/src/shared/global_state/theme_mode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(currentThemeModeProvider);

    void onTapThemeMode() => showDialog(
          context: context,
          builder: (_) => const ThemeModeDialog(),
        );

    void onTapSelectLanguage() => showDialog(
          context: context,
          builder: (_) => const SelectLanguageDialog(),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.settings).tr(),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text(LocaleKeys.themeMode).tr(),
            trailing: Text(themeMode.label),
            onTap: onTapThemeMode,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text(LocaleKeys.select_language).tr(),
            onTap: onTapSelectLanguage,
          ),
        ],
      ),
    );
  }
}
