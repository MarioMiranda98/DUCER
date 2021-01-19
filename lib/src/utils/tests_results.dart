import 'package:ducer/src/models/question_response_model.dart';

class TestResults {
  TestResults._internal();

  static TestResults get instance => _instance;

  static TestResults _instance = TestResults._internal();

  Map<String, int> _finalResultTest = {
    'er': 0,
    'ad': 0,
    'cc': 0,
    'as': 0,
    'pa': 0,
    'ca': 0
  };

  Map<String, int> calculateResult(String testIdentifier, List<QuestionResponseModel> qrm) {
    _clearDictionaries();

    for(int i = 0; i < qrm.length; i++) {
      if(qrm[i].response) {
        final currentValue = _finalResultTest[qrm[i].childProblem];
        _finalResultTest[qrm[i].childProblem] = currentValue + 1;
      }
    }

    return _finalResultTest;
  }

  void _clearDictionaries() {
    _finalResultTest['er'] = 0;
    _finalResultTest['ad'] = 0;
    _finalResultTest['cc'] = 0;
    _finalResultTest['as'] = 0;
    _finalResultTest['pa'] = 0;
    _finalResultTest['ca'] = 0;
  }
}