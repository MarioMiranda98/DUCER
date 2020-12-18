import 'package:ducer/src/data/enums/email_enums.dart';
import 'package:ducer/src/data/enums/incidences_enum.dart';
import 'package:ducer/src/data/enums/password_enums.dart';
import 'package:ducer/src/data/enums/sign_in_enums.dart';
import 'package:ducer/src/models/incidences_model.dart';

abstract class Validators {
  static EmailErrors emailValidator(String email) {
    email = email.trim();
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (email.length == 0) {
      return EmailErrors.EMPTY_EMAIL;
    } else if (!regExp.hasMatch(email)) {
      return EmailErrors.INVALID_EMAIL;
    }
    return null;
  }

  static PasswordErrors passwordValidator(String password) {
    password = password.trim();
    if (password == null || password.isEmpty) return PasswordErrors.EMPTY_PASSWORD;
    if (password.length < 6) return PasswordErrors.PASSWORD_LENGTH;
    return null;
  }

  static PasswordErrors passwordsMatch(String password, String confirmPassword) {
    password = password.trim();
    confirmPassword = confirmPassword.trim();

    if(password != confirmPassword)
      return PasswordErrors.PASSWORDS_DO_NOT_MATCH;
    
    return null;
  }

  static SignInErrors nameValidator(String name) {
    name = name.trim();
    if(name == null || name.isEmpty) return SignInErrors.EMPTY_NAME;
    return null;
  }

  static SignInErrors lastNameValidator(String lastName) {
    lastName = lastName.trim();
    if(lastName == null || lastName.isEmpty) return SignInErrors.EMPTY_LAST_NAME;
    return null;
  }

  static SignInErrors birthDateValidator(String birthDate) {
    birthDate = birthDate.trim();
    if(birthDate == null || birthDate.isEmpty) return SignInErrors.BIRTH_DATE_IS_NOT_SELECTED;
    return null;
  }

  static SignInErrors genderValidator(bool isManSeleced, bool isWomanSelected) {
    if(!isManSeleced && !isWomanSelected) return SignInErrors.GENDER_NOT_SELECTED;
    return null;
  }

  static IncidencesEnum validateIncidence(String text, List<IncidencesModel> selectedIncidences) {
    if((text == null || text.isEmpty) && selectedIncidences.length == 0) return IncidencesEnum.THERE_ARE_NOT_INCIDENCES_SELECTED;
    return null;
  }
}