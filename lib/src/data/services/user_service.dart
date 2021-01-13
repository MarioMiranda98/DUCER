import 'package:ducer/src/data/interfaces/user_interface.dart';
import 'package:ducer/src/data/repositories/user_repository.dart';
import 'package:ducer/src/models/user_model.dart';

class UserService extends UserInterface {
  UserService._internal();

  static UserService get instance => _instance;

  static UserService _instance = UserService._internal(); 

  @override
  Future<UserModel> getUserInfo({String email}) async {
    final userRepository = UserRepository.instance;
    final res = await userRepository.getUserInfo(
      email: email
    );

    if(!res.isEmpty) return UserModel.fromJson(res.data[0]);
    else return null;
  }
}