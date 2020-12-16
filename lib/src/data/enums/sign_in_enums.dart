enum SignInErrors {
  EMPTY_NAME,
  EMPTY_LAST_NAME,
  BIRTH_DATE_IS_NOT_SELECTED,
  GENDER_NOT_SELECTED,
  REGISTER_ERROR,
}

enum SignInSuccess {
  USER_CREATED
}

extension SignInErrorsExtension on SignInErrors {
  String get signInError {
    switch (this) {
      case SignInErrors.EMPTY_NAME:
        return 'El nombre no debe estar vacio';
        break;
      case SignInErrors.EMPTY_LAST_NAME:    
        return 'El apellido no debe estar vacio';
        break;
      case SignInErrors.BIRTH_DATE_IS_NOT_SELECTED:
        return 'La fecha de nacimiento no ha sido seleccionada';
        break;
      case SignInErrors.GENDER_NOT_SELECTED:
        return 'Debes seleccionar tu género';
        break;
      case SignInErrors.REGISTER_ERROR:
        return 'Ha ocurrido un error en el registro';
        break;
      default: 
        return null;
        break;
    }
  }

  String get signInErrorTitle {
    switch (this) {
      case SignInErrors.EMPTY_NAME:
        return 'Error en el nombre';
        break;
      case SignInErrors.EMPTY_LAST_NAME:    
        return 'Error en el apellido';
        break;
      case SignInErrors.BIRTH_DATE_IS_NOT_SELECTED:
        return 'Error en la fecha de nacimiento';
        break;
      case SignInErrors.GENDER_NOT_SELECTED:
        return 'Error en el género';
        break;
      case SignInErrors.REGISTER_ERROR:
        return 'Error en el registro';
        break;
      default: 
        return null;
        break;
    }
  }
}

extension SignInSuccessExtension on SignInSuccess {
  String get message {
    switch (this) {
      case SignInSuccess.USER_CREATED:
        return 'Usuario creado';
        break;
      default:
        return '';
        break;
    }
  }
}