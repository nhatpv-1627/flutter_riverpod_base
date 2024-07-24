import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/data/app_error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueUI on AsyncValue<void> {
  bool get isLoading => this is AsyncLoading<void>;

  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text((error as AppError).message ?? ''),
            ),
          );
        },
      );
}

extension ThemeModeX on ThemeMode {
  String get label => switch (this) {
        ThemeMode.system => LocaleKeys.system,
        ThemeMode.light => LocaleKeys.light,
        ThemeMode.dark => LocaleKeys.dark,
      };
}

extension LocaleX on Locale {
  String get label {
    switch (languageCode) {
      case 'vi':
        return LocaleKeys.vietnamese;
      default:
        return LocaleKeys.english;
    }
  }
}
