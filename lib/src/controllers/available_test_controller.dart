import 'package:ducer/src/pages/test_resolve/test_resolve_page.dart';
import 'package:get/get.dart';

import 'package:ducer/src/models/test_model.dart';

class AvailableTestController extends GetxController {
  String _childName;
  List<TestModel> _availableTests = [
    TestModel(
      indentifier: 't1',
      titleTest: 'Test 1',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 't2',
      titleTest: 'Test 2',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 't3',
      titleTest: 'Test 3',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 't4',
      titleTest: 'Test 4',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 't5',
      titleTest: 'Test 5',
      destinationPage: TestResolvePage(),
    ),    
    TestModel(
      indentifier: 't6',
      titleTest: 'Test 6',
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