import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../storage.dart';

abstract class SecureStorageAbstract {
  Future<String?> getString({required String key});
}

class SecureStorage implements Storage, SecureStorageAbstract {
  SecureStorage();

  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  @override
  Future<void> clear() => _secureStorage.deleteAll();

  @override
  Future<bool> containsKey({required String key}) {
    return _secureStorage.containsKey(key: key);
  }

  @override
  Future<void> delete({required String key}) {
    return _secureStorage.delete(key: key);
  }

  @override
  Future<String?> getString({required String key}) {
    return _secureStorage.read(key: key);
  }

  @override
  Future<void> setString({required String key, required String value}) {
    return _secureStorage.write(key: key, value: value);
  }
}
