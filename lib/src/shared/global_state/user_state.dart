import 'dart:convert';

import 'package:flutter_base/src/data/local/prefs/prefs.dart';
import 'package:flutter_base/src/data/local/prefs/shared_keys.dart';
import 'package:flutter_base/src/data/model/user_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_state.g.dart';

@riverpod
class UserState extends _$UserState {
  @override
  UserData build() {
    final prefs = ref.watch(prefsProvider).valueOrNull;
    final raw = jsonDecode(prefs?.getString(SharedKeys.currentUser.name) ?? '');
    final UserData user = UserData.fromJson(raw);

    return user;
  }
}
