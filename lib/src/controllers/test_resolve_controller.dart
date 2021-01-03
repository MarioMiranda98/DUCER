import 'package:get/get.dart';

import 'package:ducer/src/models/question_response_model.dart';

class TestResolveController extends GetxController {
  String _testIdentifier;
  String _testName;
  List<QuestionResponseModel> _selectedValues = [
    QuestionResponseModel(questionIndex: 0, response: true),
    QuestionResponseModel(questionIndex: 1, response: true),
    QuestionResponseModel(questionIndex: 2, response: true),
    QuestionResponseModel(questionIndex: 3, response: true),
    QuestionResponseModel(questionIndex: 4, response: true),
  ];

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
  List<QuestionResponseModel> get selectedValues => this._selectedValues;

  set testIdentifier(String value) {
    this._testIdentifier = value;
  }

  set testName(String value) {
    this._testName = value;
  }

  set selectedValues(List<QuestionResponseModel> value) {
    this._selectedValues = value;
  }
}