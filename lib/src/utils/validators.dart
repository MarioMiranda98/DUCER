import 'package:ducer/src/data/enums/email_enums.dart';
import 'package:ducer/src/data/enums/password_enums.dart';

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
}