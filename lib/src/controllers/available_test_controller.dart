import 'package:ducer/src/pages/test_resolve/test_resolve_page.dart';
import 'package:get/get.dart';

import 'package:ducer/src/models/test_model.dart';

class AvailableTestController extends GetxController {
  String _childName;
  List<TestModel> _availableTests = [
    TestModel(
      indentifier: 'hpd',
      titleTest: 'Hiperactividad',
      status: 'Realizado',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 'aea',
      titleTest: 'Autoestima',
      status: 'Realizado',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 'cth',
      titleTest: '¿Confia tu hijo en ti?',
      status: 'Sin realizar',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 'ims',
      titleTest: 'Inteligencia Múltiple',
      status: 'Realizado',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 'psd',
      titleTest: 'Personalidad',
      status: 'Sin Realizar',
      destinationPage: TestResolvePage(),
    ),    
  ];

  String get childName => this._childName;
  List<TestModel> get availableTests => this._availableTests;

  set childName(String value) {
    this._childName = value;
    update();
  }
}