import 'package:ducer/src/models/user_model.dart';

abstract class UserInterface {
  Future<UserModel> getUserInfo({String email});
}