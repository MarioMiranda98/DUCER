abstract class IncidencesInterface {
  Future<int> registerIncidence({Map<String, dynamic> body});

  Future<int> updateIncidence({Map<String, dynamic> body, List<dynamic> args});

  Future<dynamic> getAllIncidences({List<dynamic> args});

  Future<int> createIncidence({Map<String, dynamic> body});
}