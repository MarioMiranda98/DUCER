abstract class ChildInterface {
  Future<int> registerChild({Map<String, dynamic> body});

  Future<dynamic> getAllChildren({String email});

  Future<dynamic> getChild({Map<String, dynamic> body});
}