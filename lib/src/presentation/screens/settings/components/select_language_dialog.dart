import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/shared/extensions/common_exts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectLanguageDialog extends ConsumerWidget {
  const SelectLanguageDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      clipBehavior: Clip.antiAlias,
      children: [
        for (final locale in context.supportedLocales)
          _SelectLanguageDialogOption(
            locale: locale,
            onTap: () {
              context.setLocale(locale);
            },
          )
      ],
    );
  }
}

class _SelectLanguageDialogOption extends StatelessWidget {
  const _SelectLanguageDialogOption(
      {required this.locale, required this.onTap});

  final Locale locale;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(locale.label),
    );
  }
}
