import 'package:ducer/src/data/repositories/create_account_repository.dart';

class CreateAccountService {
  CreateAccountService._internal();

  static CreateAccountService get instance => _instance;

  static CreateAccountService _instance = CreateAccountService._internal();

  Future<int> registerUser({String tableName, Map<String, dynamic> body}) async {
    final createAccountRepository = CreateAccountRepository.instance; 
    final res = await createAccountRepository.registerUser(
      tableName: tableName,
      body: body
    );

    return res;
  }

  Future<dynamic> validateRepeated({String tableName, Map<String, dynamic> body}) async {
    final createAccountRepository = CreateAccountRepository.instance;
    final res = await createAccountRepository.validateRepeated(
      tableName: tableName,
      body: body,
    );

    if(!res.isEmpty) return res.data;
    else return null;
  }
}