import 'package:ducer/src/data/repositories/login_repository.dart';

class LoginService {
  LoginService._internal();

  static LoginService get instance => _instance;

  static LoginService _instance = LoginService._internal();

  Future<dynamic> logIn({Map<String, dynamic> body}) async {
    final loginRepository = LoginRepository.instance;
    final res = await loginRepository.logIn(
      body: body
    ); 

    if(!res.isEmpty) return res.data;
    else return null;
  } 
}