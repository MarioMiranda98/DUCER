import 'package:ducer/src/data/enums/data_base_tables_enums.dart';
import 'package:ducer/src/data/repositories/generic_crud_repository.dart';
import 'package:ducer/src/models/response_data_base_model.dart';

class TestRepository {
  TestRepository._internal();

  static TestRepository get instance => _instance;

  static TestRepository _instance = TestRepository._internal();

  Future<int> registerTest({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.create(
      tableName: DataBaseTablesEnum.TESTS.tableName,
      body: body
    );

    return res;
  }

  Future<ResponseDataBaseModel> getChildTest({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.readFor(
      tableName: DataBaseTablesEnum.TESTS.tableName,
      where: 'email = ? AND name = ? AND first_last_name = ? AND second_last_name = ?',
      args: [body['email'], body['name'], body['firstLastName'], body['secondLastName']]
    );

    return res;
  }
}