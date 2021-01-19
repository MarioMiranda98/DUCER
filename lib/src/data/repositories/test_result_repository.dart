import 'package:ducer/src/data/enums/data_base_tables_enums.dart';
import 'package:ducer/src/data/repositories/generic_crud_repository.dart';

class TestResultRepository {
  TestResultRepository._internal();

  static TestResultRepository get instance => _instance;

  static TestResultRepository _instance = TestResultRepository._internal();

  Future<int> registerTest({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.create(
      tableName: DataBaseTablesEnum.TESTS.tableName,
      body: body
    );

    return res;
  }
}