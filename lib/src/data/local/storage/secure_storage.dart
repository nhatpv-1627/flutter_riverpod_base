import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._(this._flutterSecureStorage, this._cache);

  late final FlutterSecureStorage _flutterSecureStorage;

  late final Map<String, String> _cache;

  static Future<SecureStorage> getInstance({required Set<String> keys}) async {
    const flutterSecureStorage = FlutterSecureStorage();
    final cache = <String, String>{};
    await keys
        .map((key) => flutterSecureStorage.read(key: key).then((value) {
              if (value != null) {
                cache[key] = value;
              }
            }))
        .wait;
    return SecureStorage._(flutterSecureStorage, cache);
  }

  String? get(String key) => _cache[key];

  Future<void> set(String key, String value) {
    _cache[key] = value;
    return _flutterSecureStorage.write(key: key, value: value);
  }

  Future<void> remove(String key) {
    _cache.remove(key);
    return _flutterSecureStorage.delete(key: key);
  }

  Future<void> removeAll() {
    _cache.clear();
    return _flutterSecureStorage.deleteAll();
  }
}
