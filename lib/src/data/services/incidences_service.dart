import 'package:ducer/src/data/interfaces/incidences_interface.dart';
import 'package:ducer/src/data/repositories/incidences_repository.dart';

class IncidencesService extends IncidencesInterface {
  IncidencesService._internal();

  static IncidencesService get instance => _instance;

  static IncidencesService _instance = IncidencesService._internal();

  @override
  Future<dynamic> getAllIncidences({List args}) async {
    final incidencesRepository = IncidencesRepository.instance;
    final res = await incidencesRepository.getAllIncidences(
      args: args,
    );

    if(!res.isEmpty) return res.data;
    else return null;
  }

  @override
  Future<int> registerIncidence({Map<String, dynamic> body}) async {
    final incidencesRepository = IncidencesRepository.instance;
    final res = await incidencesRepository.registerIncidence(
      body: body
    );

    return res;
  }

  @override
  Future<int> updateIncidence({Map<String, dynamic> body, List args}) async {
    final incidencesRepository = IncidencesRepository.instance;
    final res = await incidencesRepository.updateIncidence(
      body: body,
      args: args
    );

    return res;
  }

  @override
  Future<int> createIncidence({Map<String, dynamic> body}) async {
    final incidencesRepository = IncidencesRepository.instance;
    final res = await incidencesRepository.createIncidence(
      body: body
    );

    return res;
  }
}