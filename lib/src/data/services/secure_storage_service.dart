import 'package:ducer/src/data/interfaces/secure_storage_interface.dart';
import 'package:ducer/src/data/repositories/secure_storage_repository.dart';

class SecureStorageService extends SecureStorageInterface {
  SecureStorageService._internal();

  static SecureStorageService get instance => _instance;

  static SecureStorageService _instance = SecureStorageService._internal();

  @override
  Future<void> saveUserEmail(String email) async {
    return await SecureStorageRepository.instance.saveUserEmail(email);
  }

  @override
  Future<String> getUserEmail() async {
    return await SecureStorageRepository.instance.getUserEmail();
  }

  @override
  Future<void> deleteUserEmail() async {
    return await SecureStorageRepository.instance.deleteUserEmail();
  }
}