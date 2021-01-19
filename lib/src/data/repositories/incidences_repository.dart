import 'package:ducer/src/data/enums/data_base_tables_enums.dart';
import 'package:ducer/src/data/repositories/generic_crud_repository.dart';
import 'package:ducer/src/models/response_data_base_model.dart';

class IncidencesRepository {
  IncidencesRepository._internal();

  static IncidencesRepository get instance => _instance;

  static IncidencesRepository _instance = IncidencesRepository._internal();

  Future<int> registerIncidence({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res  = await genericCrud.create(
      tableName: DataBaseTablesEnum.REGISTER_INCIDENCES.tableName,
      body: body
    );

    return res;
  }

  Future<int> createIncidence({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.create(
      body: body,
      tableName: DataBaseTablesEnum.INCIDENCES.tableName,
    );

    return res;
  }

  Future<int> updateIncidence({Map<String, dynamic> body, List<dynamic> args}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.update(
      tableName: DataBaseTablesEnum.INCIDENCES.tableName,
      body: body,
      where: 'name = ? AND first_last_name = ? AND second_last_name = ?',
      args: args
    );

    return res;
  }

  Future<ResponseDataBaseModel> getAllIncidences({Map<String, dynamic> body, List<dynamic> args}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.readFor(
      tableName: DataBaseTablesEnum.INCIDENCES.tableName,
      where: 'name = ? AND first_last_name = ? AND second_last_name = ?',
      args: args
    );

    return res;
  }
}