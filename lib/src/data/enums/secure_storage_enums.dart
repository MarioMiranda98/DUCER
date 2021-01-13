enum SecureStorageEnums {
  USER_EMAIL
}

extension SecureStorageExtension on SecureStorageEnums {
  String get key {
    switch(this) {
      case SecureStorageEnums.USER_EMAIL:
        return 'userEmail';
      default:
        return '';     
    }
  }
}