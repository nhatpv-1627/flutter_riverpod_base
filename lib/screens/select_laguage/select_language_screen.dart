import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.select_language).tr(),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SelectLanguageItem(
              title: LocaleKeys.english.tr(),
              subtitle: LocaleKeys.english.tr(),
              locale: context.supportedLocales[0],
            ),
            const _Divider(),
            _SelectLanguageItem(
              title: LocaleKeys.vietnamese.tr(),
              subtitle: LocaleKeys.vietnamese.tr(),
              locale: context.supportedLocales[1],
            ),
            const _Divider(),
            _SelectLanguageItem(
              title: LocaleKeys.arbic.tr(),
              subtitle: LocaleKeys.arbic.tr(),
              locale: context.supportedLocales[2],
            ),
            const _Divider(),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: const Divider(
        color: Colors.grey,
      ),
    );
  }
}

class _SelectLanguageItem extends StatelessWidget {
  const _SelectLanguageItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.locale,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Locale locale;

  bool isSelected(BuildContext context) => locale == context.locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
        border:
            isSelected(context) ? Border.all(color: Colors.blueAccent) : null,
      ),
      child: ListTile(
          dense: true,
          // isThreeLine: true,
          title: Text(
            title,
          ),
          subtitle: Text(
            subtitle,
          ),
          onTap: () async {
            log(locale.toString(), name: toString());
            await context.setLocale(locale);
            Navigator.pop(context);
          }),
    );
  }
}
