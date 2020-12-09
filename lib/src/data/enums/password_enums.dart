enum PasswordErrors {
  EMPTY_PASSWORD,
  PASSWORD_LENGTH
}

extension PasswordErrorsExtension on PasswordErrors {
  String get passwordErrors {
    switch (this) {
      case PasswordErrors.EMPTY_PASSWORD:
        return 'La contraseña no puede ser vacia';
        break;
      case PasswordErrors.PASSWORD_LENGTH:
        return 'La contraseña debe tener minimo 6 caracteres';
        break;
      default:
        return '';
        break;
    }
  }
}