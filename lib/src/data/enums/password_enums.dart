enum PasswordErrors {
  EMPTY_PASSWORD,
  PASSWORD_LENGTH,
  PASSWORDS_DO_NOT_MATCH,
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
      case PasswordErrors.PASSWORDS_DO_NOT_MATCH:
        return 'Las contraseñas no coinciden';
        break;
      default:
        return '';
        break;
    }
  }
}