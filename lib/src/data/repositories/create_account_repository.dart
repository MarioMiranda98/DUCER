import 'package:ducer/src/data/interfaces/create_account_interface.dart';
import 'package:ducer/src/data/repositories/generic_crud_repository.dart';

import 'package:ducer/src/data/enums/data_base_tables_enums.dart';

class CreateAccountRepository extends CreateAccountInterface {
  CreateAccountRepository._internal();

  static CreateAccountRepository get instance => _instance;

  static CreateAccountRepository _instance = CreateAccountRepository._internal();

  Future<int> registerUser({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.create(
      tableName: DataBaseTablesEnum.REGISTER_USER.tableName,
      body: body
    );

    return res;
  }

  Future<dynamic> validateRepeated({Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.readFor(
      tableName: DataBaseTablesEnum.REGISTER_USER.tableName,
      where: 'email = ?',
      args: [body['email']]
    );

    return res;
  }
}