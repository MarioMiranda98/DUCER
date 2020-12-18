enum IncidencesEnum {
  SUCCESS,
  FAILED,
  THERE_ARE_NOT_INCIDENCES_SELECTED,
}

extension IncidencesEnumExtension on IncidencesEnum {
  String get message {
    switch (this) {
      case IncidencesEnum.SUCCESS:
        return 'La incidencia fue registrada';
        break;
      case IncidencesEnum.FAILED:
        return 'La incidencia no se ha podido registrar';
        break;
      case IncidencesEnum.THERE_ARE_NOT_INCIDENCES_SELECTED:
        return 'No hay incidencias seleccionadas';
        break;
      default:
        return '';
        break;
    }
  }

  String get title {
    switch (this) {
      case IncidencesEnum.SUCCESS:
        return '¡Exito!';
        break;
      case IncidencesEnum.FAILED:
        return 'Error';
        break;
      case IncidencesEnum.THERE_ARE_NOT_INCIDENCES_SELECTED:
        return 'Incidencia vacias';
        break;
      default:
        return '';
        break;
    }
  }
}