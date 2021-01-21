import 'package:ducer/src/controllers/behavior_chart_controller.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:get/get.dart';

import 'package:ducer/src/data/services/incidences_service.dart';
import 'package:ducer/src/models/registered_incidences_model.dart';

class DashboardController extends GetxController {
  String _childName;
  RegisteredIncidencesModel _rim;
  bool _isChartReady = false;
  bool _activateGreenLight = true;
  bool _activateYellowLight = false;
  bool _activateRedLight = false;
  String _suggestion = '';

  String get childName => _childName;
  RegisteredIncidencesModel get rim => _rim;
  bool get isChartReady => _isChartReady;
  bool get activateGreenLight => _activateGreenLight;
  bool get activateYellowLight => _activateYellowLight;
  bool get activateRedLight => _activateRedLight;
  String get suggestion => _suggestion;

  set rimS(RegisteredIncidencesModel value) {
    _rim = value;
  }

  set childName(String value) {
    _childName = value;

    _aux();
    update(['child-name']);
  }

  Future<void> _loadChildInfo() async {
    _isChartReady = false;
    update(['dashboard-body']);

    final incidencesService = IncidencesService.instance;
    final res = await incidencesService.getAllIncidences(
      args: [
        childName.split(' ')[0], 
        childName.split(' ')[1], 
        childName.split(' ')[2], 
      ]
    );    
      
    rimS = RegisteredIncidencesModel.fromJson(res[0]);
    final BehaviorChartController bcc = Get.put(BehaviorChartController());
    bcc.generateData(_rim);
    _isChartReady = true;
    _calculateLight();
    _suggestion = Helpers.getSuggestion(_rim.getAllQuantityOfIncidences());
    
    update(['dashboard-body']);
  }

  void _aux() async {
    await _loadChildInfo();
  }

  void _calculateLight() {
    final qoi = _rim.getAllQuantityOfIncidences();

    if(qoi < 16) {
      _activateGreenLight = true;
      _activateYellowLight = false;
      _activateRedLight = false;
    } else if(qoi < 30) {
      _activateGreenLight = false;
      _activateYellowLight = true;
      _activateRedLight = false;
    } else if(qoi >= 30) {
      _activateGreenLight = false;
      _activateYellowLight = false;
      _activateRedLight = true;
    }
  }
}