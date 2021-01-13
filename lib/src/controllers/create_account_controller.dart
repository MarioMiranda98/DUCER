import 'package:ducer/src/data/services/secure_storage_service.dart';
import 'package:ducer/src/pages/home_page.dart';
import 'package:get/get.dart';

import 'package:ducer/src/data/enums/email_enums.dart';
import 'package:ducer/src/data/enums/password_enums.dart';
import 'package:ducer/src/utils/validators.dart';   
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/data/enums/sign_in_enums.dart';
import 'package:ducer/src/models/create_account_model.dart';
import 'package:ducer/src/data/services/create_account_service.dart';

class CreateAccountController extends GetxController {
  bool _isMan = false;
  bool _isWoman = false;
  List<dynamic> _signInValidations = List<dynamic>();
  List<dynamic> _passwordValidations = List<dynamic>();

  @override
    get onDelete => super.onDelete;

  Future<void> validateInputs(Map<String, dynamic> signInForm) async {
    
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
      final values = CreateAccountModel.fromJson(signInForm);
      final body = {'email': signInForm['email'], 'password': signInForm['password']};

      final createAccountService = CreateAccountService.instance;

      final repeated = await createAccountService.validateRepeated(
        body: body
      );

      if(repeated != null) {
          Helpers.openSnackBar('Error', 'El correo ya esta registrado');
        } else {
        
        final res = await createAccountService.registerUser(
          body: values.toJson()  
        );
  
        if(res != 0) {
          await SecureStorageService.instance.saveUserEmail(signInForm['email']);
          Helpers.openSnackBar('¡Exito!', SignInSuccess.USER_CREATED.message);
          Future.delayed(Duration(seconds: 3), () {
            Get.offAll(HomePage(), transition: Transition.cupertino);
          });
        } else {
          Helpers.openSnackBar('Error', 'Ocurrio un error durante el registro');
        }
      }
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