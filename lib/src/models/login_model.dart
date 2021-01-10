class LoginModel {
  String email;
  String password;

  LoginModel({
    this.email,
    this.password
  });

  LoginModel.fromJson(Map<String, dynamic> map) {
    email = map['email'];
    password = map['password'];
  }

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password
  };
}