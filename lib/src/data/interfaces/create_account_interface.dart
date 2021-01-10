abstract class CreateAccountInterface {
  Future<int> registerUser({String tableName, Map<String, dynamic> body});
  
  Future<dynamic> validateRepeated({String tableName, Map<String, dynamic> body});
}