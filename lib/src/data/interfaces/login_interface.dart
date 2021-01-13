import 'package:ducer/src/models/response_data_base_model.dart';

abstract class LoginInterface {
  Future<ResponseDataBaseModel> logIn({Map<String, dynamic> body});
}