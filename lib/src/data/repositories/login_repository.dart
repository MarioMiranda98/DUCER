import 'package:ducer/src/data/interfaces/login_interface.dart';
import 'package:ducer/src/data/repositories/generic_crud_repository.dart';
import 'package:ducer/src/models/response_data_base_model.dart';

class LoginRepository extends LoginInterface {
  LoginRepository._internal();

  static LoginRepository get instance => _instance;

  static LoginRepository _instance = LoginRepository._internal();

  Future<ResponseDataBaseModel> logIn({String tableName, Map<String, dynamic> body}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.readFor(
      tableName: tableName,
      where: 'email = ? AND password = ?',
      args: [body['email'], body['password']]
    );

    return res;
  }
}