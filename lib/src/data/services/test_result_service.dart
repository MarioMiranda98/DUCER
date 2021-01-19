import 'package:ducer/src/data/interfaces/test_interface.dart';
import 'package:ducer/src/data/repositories/test_result_repository.dart';

class TestResultService extends TestInterface {
  TestResultService._internal();

  static TestResultService get instance => _instance;

  static TestResultService _instance = TestResultService._internal();

  @override
  Future<int> registerTest({Map<String, dynamic> body}) async {
    final testResultRepository = TestResultRepository.instance;
    final res = await testResultRepository.registerTest(
      body: body
    );

    return res;
  }
}