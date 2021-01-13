import 'package:ducer/src/data/enums/data_base_tables_enums.dart';
import 'package:ducer/src/data/repositories/generic_crud_repository.dart';
import 'package:ducer/src/models/response_data_base_model.dart';

class UserRepository {
  UserRepository._internal();

  static UserRepository get instance => _instance;

  static UserRepository _instance = UserRepository._internal();

  Future<ResponseDataBaseModel> getUserInfo({String email}) async {
    final genericCrud = GenericCrudRepository.instance;
    final res = await genericCrud.readFor(
      tableName: DataBaseTablesEnum.REGISTER_USER.tableName,
      where: 'email = ?',
      args: [email]
    );

    return res;
  }
}