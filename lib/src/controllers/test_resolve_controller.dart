import 'package:get/get.dart';

class TestResolveController extends GetxController {
  String _testIdentifier;
  String _testName;

  List<String> _questions = [
    '¿Pasa mucho tiempo soñando despierto?',
    '¿Desea frecuentemente ser otra persona?',
    '¿Se divierte con sus padres?',
    '¿Desea frecuentemente ser otra persona?',
    '¿Desea frecuentemente ser otra persona?',
  ];

  String get testIdentifier => this._testIdentifier;
  String get testName => this._testName;
  List<String> get questions => this._questions;

  set testIdentifier(String value) {
    this._testIdentifier = value;
  }

  set testName(String value) {
    this._testName = value;
  }
}