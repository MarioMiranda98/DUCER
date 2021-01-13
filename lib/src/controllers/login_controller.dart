import 'package:ducer/src/data/services/secure_storage_service.dart';
import 'package:get/get.dart';

import 'package:ducer/src/models/login_model.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/pages/create_account_page.dart';
import 'package:ducer/src/data/services/login_service.dart';
import 'package:ducer/src/utils/validators.dart';
import 'package:ducer/src/pages/home_page.dart';
import 'package:ducer/src/data/enums/email_enums.dart';
import 'package:ducer/src/data/enums/password_enums.dart';

class LoginController extends GetxController {
  Future<void> onSignIn(String email, String password) async {
    final validateEmail = Validators.emailValidator(email);
    final validatePassword = Validators.passwordValidator(password);

    if(validateEmail == null && validatePassword == null) {
      final aux = LoginModel.fromJson({'email': email, 'password': password});
      final loginService = LoginService.instance;
      final res = await loginService.logIn(
        body: aux.toJson()
      );

      if(res != null) { 
        await SecureStorageService.instance.saveUserEmail(email);
        Get.off(HomePage());
      } else Helpers.openSnackBar('Error en el login', 'Datos erroneos');
    } else {
      if(validateEmail != null)
        Helpers.openSnackBar('Error en email', validateEmail.emailError);
      else 
        Helpers.openSnackBar('Error en contraseña', validatePassword.passwordErrors);
    }
  }

  void toCreateAccount() {
    Get.to(CreateAccountPage());
  }
}