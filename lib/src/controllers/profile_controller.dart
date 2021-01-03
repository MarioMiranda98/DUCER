import 'package:get/get.dart';

class ProfileController extends GetxController {
  String _name;
  String _firstLastName;
  String _secondLastName;
  String _creationDate;

  @override
  void onInit() {
    super.onInit();
    _name = 'Pedrito';
    _firstLastName = 'Lopex';
    _secondLastName = 'Padre';
    _creationDate = '10-12-2026';
  }

  String get name => this._name;
  String get firstLastName => this._firstLastName;
  String get secondLastName => this._secondLastName;
  String get creationDate => this._creationDate;
}