class UserModel {
  String name;
  String firstLastName;
  String secondLastName;
  String dob;
  String gender;
  String email;

  UserModel({
    this.name,
    this.firstLastName,
    this.secondLastName,
    this.dob,
    this.gender,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    firstLastName = map['first_last_name'];
    secondLastName = map['second_last_name'];
    dob = map['birthDate'];
    gender = map['gender'];
    email = map['email'];
  }

  Map<String, dynamic> toJson() => {
    'name' : name,
    'first_last_name' : firstLastName,
    'second_last_name' : secondLastName,
    'dob' : dob,
    'gender' : gender,
    'email' : email,
  };
}