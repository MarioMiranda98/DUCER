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

  void validateInputs(Map<String, dynamic> signInForm) {
    
    bool isSignInCorrect = true;

    final validateName = Validators.nameValidator(signInForm['name']);
    _signInValidations.add(validateName);

    final validateFirstLastName = Validators.lastNameValidator(signInForm['firstLastName']);
    _signInValidations.add(validateFirstLastName);

    final validateSecondLastName = Validators.lastNameValidator(signInForm['secondLastName']);
    _signInValidations.add(validateSecondLastName);

    final validateBirthDate = Validators.birthDateValidator(signInForm['birthDate']);
    _signInValidations.add(validateBirthDate);

    final validateGender = Validators.genderValidator(
      signInForm['isManSelected'], signInForm['isWomanSelected']);
    _signInValidations.add(validateGender);

    final validateEmail = Validators.emailValidator(signInForm['email']);

    final validatePassword = Validators.passwordValidator(signInForm['password']);
    _passwordValidations.add(validatePassword);

    final validatePasswordMatches = Validators.passwordsMatch(
      signInForm['password'], signInForm['confirmPassword']);
    _passwordValidations.add(validatePasswordMatches);

    SignInErrors sie;
    for(int i = 0; i < _signInValidations.length; i++) {
      sie = _signInValidations[i];
      if(sie != null) {
        Helpers.openSnackBar(sie.signInErrorTitle, sie.signInError);
        isSignInCorrect = false;
        break;
      }
    }

    if(validateGender != null && isSignInCorrect) {
      Helpers.openSnackBar(validateGender.signInErrorTitle, validateGender.signInError);
      isSignInCorrect = false;
    }

    if(validateEmail != null && isSignInCorrect) {
      Helpers.openSnackBar(validateEmail.emailErrorTittle, validateEmail.emailError);
      isSignInCorrect = false;
    }

    PasswordErrors pe;
    for(int i = 0; i < _passwordValidations.length; i++) {
      pe = _passwordValidations[i];
      if(pe != null && isSignInCorrect) {
        Helpers.openSnackBar(pe.passwordErrorsTitlte, pe.passwordErrors);
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