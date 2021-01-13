import 'package:ducer/src/data/enums/data_base_tables_enums.dart';
import 'package:ducer/src/data/repositories/generic_crud_repository.dart';
import 'package:ducer/src/models/response_data_base_model.dart';

class ChildRepository {
  ChildRepository._internal();

  static ChildRepository get instance => _instance;

  static ChildRepository _instance = ChildRepository._internal();

  Future<int> registerChild({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.create(
      tableName: DataBaseTablesEnum.REGISTER_CHILD.tableName,
      body: body
    );

    return res;
  }

  Future<ResponseDataBaseModel> getAllChildren({String email}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.readAll(
      tableName: DataBaseTablesEnum.REGISTER_CHILD.tableName,
      email: email
    );

    return res;
  }

  Future<ResponseDataBaseModel> getChild({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.readFor(
      tableName: DataBaseTablesEnum.REGISTER_CHILD.tableName,
      where: 'email = ? AND name = ? AND first_last_name = ? AND second_last_name = ?',
      args: [body['email'], body['name'], body['firstLastName'], body['secondLastName']]
    );

    return res;
  }
}