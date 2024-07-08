import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageService {
  Future<void> write({required String key, required String value});

  Future<String?> readKey(String key);

  Future<Map<String, String>> readAllKeys();

  Future<void> deleteKey(String key);

  Future<void> deleteAllKeys();

  Future<bool> containsKey(String key);
}

class StorageServiceImpl implements StorageService {
  StorageServiceImpl({
    required this.secureStorage,
  });

  final FlutterSecureStorage secureStorage;

  // Write key value pairs to storage
  @override
  Future<void> write({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  // Read key value pairs from storage
  @override
  Future<String?> readKey(String key) async {
    final String? value = await secureStorage.read(key: key);
    return value;
  }

  // Read all key value pairs from storage
  @override
  Future<Map<String, String>> readAllKeys() async {
    final Map<String, String> value = await secureStorage.readAll();
    return value;
  }

  // Delete key value pairs from storage
  @override
  Future<void> deleteKey(String key) async {
    await secureStorage.delete(key: key);
  }

  // Delete all key value pairs from storage
  @override
  Future<void> deleteAllKeys() async {
    await secureStorage.deleteAll();
  }

  // Check if a key exists in storage
  @override
  Future<bool> containsKey(String key) async {
    final bool contains = await secureStorage.containsKey(key: key);
    return contains;
  }
}
