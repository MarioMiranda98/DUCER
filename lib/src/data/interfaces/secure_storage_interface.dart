abstract class SecureStorageInterface {
  Future<void> saveUserEmail(String email);

  Future<String> getUserEmail();

  Future<void> deleteUserEmail();
}