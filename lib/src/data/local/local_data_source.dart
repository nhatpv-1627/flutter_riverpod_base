// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_base/src/data/local/storage/secure_storage.dart';
import 'package:flutter_base/src/data/local/storage/storage_keys.dart';
import 'package:flutter_base/src/data/model/login_token.dart';

class LocalDataSource {
  LocalDataSource({
    required SecureStorage secureStorage,
  }) : _secureStorage = secureStorage;
  final SecureStorage _secureStorage;

  void saveAuthTokens(Token token) {
    _secureStorage.set(StorageKeys.accessToken.name, token.accessToken ?? '');
    _secureStorage.set(StorageKeys.refreshToken.name, token.refreshToken ?? '');
  }

  void clearLocalData() {
    _secureStorage.removeAll();
  }
}
