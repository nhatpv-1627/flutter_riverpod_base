import 'package:flutter_base/src/data/local/local_data_source.dart';
import 'package:flutter_base/src/data/local/storage/secure_storage.dart';
import 'package:flutter_base/src/data/local/storage/storage_keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SecureStorage> secureStorage(SecureStorageRef ref) {
  return SecureStorage.getInstance(
      keys: StorageKeys.values.map((e) => e.name).toSet());
}

@Riverpod(keepAlive: true)
LocalDataSource localDataSource(LocalDataSourceRef ref) {
  return LocalDataSource(
    secureStorage: ref.watch(secureStorageProvider).requireValue,
  );
}
