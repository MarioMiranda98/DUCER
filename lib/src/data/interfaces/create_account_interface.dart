abstract class CreateAccountInterface {
  Future<int> registerUser({Map<String, dynamic> body});
  
  Future<dynamic> validateRepeated({Map<String, dynamic> body});
}