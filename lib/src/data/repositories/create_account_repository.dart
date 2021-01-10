import 'package:ducer/src/data/interfaces/create_account_interface.dart';
import 'package:ducer/src/data/repositories/generic_crud_repository.dart';

class CreateAccountRepository extends CreateAccountInterface {
  CreateAccountRepository._internal();

  static CreateAccountRepository get instance => _instance;

  static CreateAccountRepository _instance = CreateAccountRepository._internal();

  Future<int> registerUser({String tableName, Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.create(
      tableName: tableName,
      body: body
    );

    return res;
  }

  Future<dynamic> validateRepeated({String tableName, Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.readFor(
      tableName: tableName,
      where: 'email = ? AND password = ?',
      args: [body['email'], body['password']]
    );

    return res;
  }
}