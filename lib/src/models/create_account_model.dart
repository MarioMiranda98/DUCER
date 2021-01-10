class CreateAccountModel {
  String name;
  String firstLastName;
  String secondLastName;
  String dob;
  String gender;
  String email;
  String password;

  CreateAccountModel({
    this.name,
    this.firstLastName,
    this.secondLastName,
    this.dob,
    this.gender,
    this.email,
    this.password,
  });

  CreateAccountModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    firstLastName = map['firstLastName'];
    secondLastName = map['secondLastName'];
    dob = map['birthDate'];
    gender = _getGenderCharacter(map['isManSelected'], map['isWomanSelected']);
    email = map['email'];
    password = map['password'];
  }

  Map<String, dynamic> toJson() => {
    'name' : name,
    'first_last_name' : firstLastName,
    'second_last_name' : secondLastName,
    'dob' : dob,
    'gender' : gender,
    'email' : email,
    'password' : password,
  };

  String _getGenderCharacter(bool isMan, bool isWoman) {
    if(isMan) return 'H';
    else if(isWoman) return 'M';
    return '';
  }
}