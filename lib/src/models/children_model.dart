class ChildrenModel {
  String email;
  String name;
  String firstLastName;
  String secondLastName;
  String birthDate;
  String diagnosis;
  bool selected;
  int order;

  ChildrenModel({
    this.email,
    this.name, 
    this.firstLastName,
    this.secondLastName,
    this.birthDate,
    this.diagnosis,
    this.selected, 
    this.order
  });

  ChildrenModel.fromJson(Map<String, dynamic> map) {
    email = map['email'];
    name = map['name'];
    firstLastName = map['first_last_name'];
    secondLastName = map['second_last_name'];
    birthDate = map['dob'];
    diagnosis = map['diagnosis'];
    selected = map['selected'];
    order = map['order'];
  }

  Map<String, dynamic> toJson() => {
    'email' : email,
    'name' : name,
    'first_last_name' : firstLastName,
    'second_last_name' : secondLastName,
    'dob' : birthDate,
    'diagnosis' : diagnosis,
  };
}