import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:ducer/src/data/enums/secure_storage_enums.dart';

class SecureStorageRepository {
  SecureStorageRepository._internal();

  static SecureStorageRepository get instance => _instance;

  static SecureStorageRepository _instance = SecureStorageRepository._internal();

  final storage = FlutterSecureStorage();

  Future<void> saveUserEmail(String email) async {
    await storage.write(key: SecureStorageEnums.USER_EMAIL.key, value: email);
  }

  Future<String> getUserEmail() async {
    final userEmail = await storage.read(key: SecureStorageEnums.USER_EMAIL.key);
    return userEmail != null ? userEmail : null;
  }

  Future<void> deleteUserEmail() async {
    await storage.delete(key: SecureStorageEnums.USER_EMAIL.key);
  }
}