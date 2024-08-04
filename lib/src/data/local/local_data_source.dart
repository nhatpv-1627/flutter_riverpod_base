// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_base/src/data/local/prefs/shared_keys.dart';
import 'package:flutter_base/src/data/local/storage/secure_storage.dart';
import 'package:flutter_base/src/data/local/storage/storage_keys.dart';
import 'package:flutter_base/src/data/model/login_token.dart';
import 'package:flutter_base/src/data/model/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  LocalDataSource({
    required SecureStorage secureStorage,
    required SharedPreferences sharedPreferences,
  })  : _secureStorage = secureStorage,
        _sharedPreferences = sharedPreferences;
  final SecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  void saveAuthTokens(Token token) {
    _secureStorage.set(StorageKeys.accessToken.name, token.accessToken ?? '');
    _secureStorage.set(StorageKeys.refreshToken.name, token.refreshToken ?? '');
  }

  void saveUser(UserData user) {
    final raw = jsonEncode(user.toJson());
    _sharedPreferences.setString(SharedKeys.currentUser.name, raw);
  }

  void clearLocalData() {
    _secureStorage.removeAll();
  }
}
