import 'package:get/get.dart';

import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/models/question_response_model.dart';

class TestResolveController extends GetxController {
  String _testIdentifier;
  String _testName;
  List<String> _questions = List<String>();
  List<QuestionResponseModel> _selectedValues = List<QuestionResponseModel>();

  String get testIdentifier => this._testIdentifier;
  String get testName => this._testName;
  List<String> get questions => this._questions;
  List<QuestionResponseModel> get selectedValues => this._selectedValues;

  set testIdentifier(String value) {
    this._testIdentifier = value;
    final aux = Helpers.getTestsQuestions(value);
    _createQuestions(aux);
  }

  set testName(String value) {
    this._testName = value;
  }

  set selectedValues(List<QuestionResponseModel> value) {
    this._selectedValues = value; 
  }

  void _createQuestions(dynamic aux) {
    _questions.clear();
    _selectedValues.clear();
    for(int i = 0; i < 11; i++) {
      final values = aux[i];
      _questions.add(values[0]);
      _selectedValues.add(
        QuestionResponseModel(
          questionIndex: i,
          response: true,
          childProblem: values[1]
        )
      );
    }
  }
}