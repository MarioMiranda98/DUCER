enum ChildEnums {
  EMPTY_FIELD,
  FAILED_REGISTER,
  SUCCESS_REGISTER
}

extension ChildEnumsExtension on ChildEnums {
  String get message {
    switch (this) {
      case ChildEnums.EMPTY_FIELD:
        return 'Los campos no pueden estar vacios';
        break;
      case ChildEnums.FAILED_REGISTER:
        return 'No se pudo hacer el registro';
        break;
      case ChildEnums.SUCCESS_REGISTER:
        return 'El registro se ha realizado';
        break;
      default:
        return '';
        break;      
    }
  }

  String get title {
    switch (this) {
      case ChildEnums.EMPTY_FIELD:
        return 'Campos vacios';
        break;
      case ChildEnums.FAILED_REGISTER:
        return 'Registro Fallido';
        break;
      case ChildEnums.SUCCESS_REGISTER:
        return 'Registro Exitoso';
        break;
      default:
        return '';
        break;      
    }
  }
}