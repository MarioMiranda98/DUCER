import 'package:ducer/src/data/interfaces/child_interface.dart';
import 'package:ducer/src/data/repositories/child_repository.dart';

class ChildService extends ChildInterface {
  ChildService._internal();

  static ChildService get instance => _instance;

  static ChildService _instance = ChildService._internal();

  @override
  Future<int> registerChild({Map<String, dynamic> body}) async {
    final childRepository = ChildRepository.instance;
    final res = await childRepository.registerChild(
      body: body
    );

    return res;
  }

  @override
  Future<dynamic> getChild({Map<String, dynamic> body}) async {
    final childRepository = ChildRepository.instance;
    final res = await childRepository.getChild(
      body: body,
    );

    if(!res.isEmpty) return res.data;
    else return null;
  }

  @override
  Future<dynamic> getAllChildren({String email}) async {
    final childRepository = ChildRepository.instance;
    final res = await childRepository.getAllChildren(
      email: email
    );

    if(!res.isEmpty) return res.data;
    else return null;
  }
}