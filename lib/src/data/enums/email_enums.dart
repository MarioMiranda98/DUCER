enum EmailErrors {
  EMPTY_EMAIL,
  INVALID_EMAIL
}

extension EmailErrorsExtension on EmailErrors {
  String get emailError {
    switch (this) {
      case EmailErrors.EMPTY_EMAIL:
        return 'El email no puede estar vacio';
        break;
      case EmailErrors.INVALID_EMAIL:
        return 'El email es invalido';
        break;
      default:
        return '';
        break;     
    }
  }

  String get emailErrorTittle {
    switch (this) {
      case EmailErrors.EMPTY_EMAIL:
        return 'Error en el email';
        break;
      case EmailErrors.INVALID_EMAIL:
        return 'Error en el email';
        break;
      default:
        return '';
        break;     
    }
  }
}