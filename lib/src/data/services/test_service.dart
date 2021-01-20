import 'package:ducer/src/data/interfaces/test_interface.dart';
import 'package:ducer/src/data/repositories/test_repository.dart';

class TestService extends TestInterface {
  TestService._internal();

  static TestService get instance => _instance;

  static TestService _instance = TestService._internal();

  @override
  Future<int> registerTest({Map<String, dynamic> body}) async {
    final testRepository = TestRepository.instance;
    final res = await testRepository.registerTest(
      body: body
    );

    return res;
  }

  @override
  Future getChildTest({Map<String, dynamic> body}) async {
    final testRepository = TestRepository.instance;
    final res = await testRepository.getChildTest(
      body: body
    );

    if(!res.isEmpty) return res.data;
    else return null;
  }
}