import 'package:get/get.dart';

import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/pages/create_account_page.dart';
import 'package:ducer/src/utils/validators.dart';
import 'package:ducer/src/pages/home_page.dart';
import 'package:ducer/src/data/enums/email_enums.dart';
import 'package:ducer/src/data/enums/password_enums.dart';

class LoginController extends GetxController {
  void onSignIn(String email, String password) {
    final validateEmail = Validators.emailValidator(email);
    final validatePassword = Validators.passwordValidator(password);

    if(validateEmail == null && validatePassword == null) {
      Get.off(HomePage());
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