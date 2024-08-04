import 'package:flutter/material.dart';
import 'package:flutter_base/src/data/local/prefs/prefs.dart';
import 'package:flutter_base/src/data/local/prefs/shared_keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode.g.dart';

@riverpod
class CurrentThemeMode extends _$CurrentThemeMode {
  @override
  ThemeMode build() {
    final prefs = ref.watch(prefsProvider).valueOrNull;

    final themeModeName = prefs?.getString(SharedKeys.themeMode.name);

    return ThemeMode.values.singleWhere(
      (themeMode) => themeMode.name == themeModeName,
      orElse: () => ThemeMode.system,
    );
  }

  void set(ThemeMode themeMode) {
    final prefs = ref.read(prefsProvider).valueOrNull;
    prefs?.setString(SharedKeys.themeMode.name, themeMode.name);
    ref.invalidateSelf();
  }
}
