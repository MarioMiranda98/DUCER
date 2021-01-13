enum DataBaseTablesEnum {
  REGISTER_USER,
  REGISTER_CHILD,
  REGISTER_INCIDENCES,
  INCIDENCES,
  TESTS
}

extension DataBaseTablesExtension on DataBaseTablesEnum {
  String get tableName {
    switch(this) {
      case DataBaseTablesEnum.REGISTER_USER:
        return 'Register_user';
      case DataBaseTablesEnum.REGISTER_CHILD:
        return 'Register_child';
      case DataBaseTablesEnum.REGISTER_INCIDENCES:
        return 'Register_incidences';
      case DataBaseTablesEnum.INCIDENCES:
        return 'Incidences';
      case DataBaseTablesEnum.TESTS:
        return 'Tests';
      default:
        return '';
    }
  }
}