import 'package:ducer/src/pages/home_page.dart';
import 'package:get/get.dart';

import 'package:ducer/src/data/enums/email_enums.dart';
import 'package:ducer/src/data/enums/password_enums.dart';
import 'package:ducer/src/utils/validators.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/data/enums/sign_in_enums.dart';

class CreateAccountController extends GetxController {
  bool _isMan = false;
  bool _isWoman = false;
  List<dynamic> _signInValidations = List<dynamic>();
  List<dynamic> _passwordValidations = List<dynamic>();

  @override
    get onDelete => super.onDelete;

  void validateInputs(String name, String firstLastName, String secondLastName,
                      String birthDate, bool isManSelected, bool isWomanSelected,
                      String email, String password, String confirmPassword) {
    
    bool isSignInCorrect = true;

    final validateName = Validators.nameValidator(name);
    _signInValidations.add(validateName);

    final validateFirstLastName = Validators.lastNameValidator(firstLastName);
    _signInValidations.add(validateFirstLastName);

    final validateSecondLastName = Validators.lastNameValidator(secondLastName);
    _signInValidations.add(validateSecondLastName);

    final validateBirthDate = Validators.birthDateValidator(birthDate);
    _signInValidations.add(validateBirthDate);

    final validateGender = Validators.genderValidator(isManSelected, isWomanSelected);
    _signInValidations.add(validateGender);

    final validateEmail = Validators.emailValidator(email);

    final validatePassword = Validators.passwordValidator(password);
    _passwordValidations.add(validatePassword);

    final validatePasswordMatches = Validators.passwordsMatch(password, confirmPassword);
    _passwordValidations.add(validatePasswordMatches);

    SignInErrors sie;
    for(int i = 0; i < _signInValidations.length; i++) {
      sie = _signInValidations[i];
      if(sie != null) {
        Helpers.openSnackBar('Error en el email', sie.signInError);
        isSignInCorrect = false;
        break;
      }
    }

    if(validateEmail != null && isSignInCorrect) {
      Helpers.openSnackBar('Error en email', validateEmail.emailError);
      isSignInCorrect = false;
    }

    PasswordErrors pe;
    for(int i = 0; i < _passwordValidations.length; i++) {
      pe = _passwordValidations[i];
      if(pe != null && isSignInCorrect) {
        Helpers.openSnackBar('Error en contraseña', pe.passwordErrors);
        isSignInCorrect = false;
        break;
      }
    }

    if(isSignInCorrect) { 
      Helpers.openSnackBar('¡Exito!', SignInSuccess.USER_CREATED.message);
      Future.delayed(Duration(seconds: 3), () {
        Get.offAll(HomePage(), transition: Transition.cupertino);
      });
    }

    _signInValidations.clear();
    _passwordValidations.clear();
  }

  get isMan => this._isMan;
  get isWoman => this._isWoman;

  set isMan(bool value) {
    this._isMan = value;
    
    if(this._isMan) this._isWoman = false;

    update(['create-account']);
  }

  set isWoman(bool value) {
    this._isWoman = value;

    if(this._isWoman) this._isMan = false;

    update(['create-account']);
  }
}