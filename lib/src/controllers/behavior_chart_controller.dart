import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:ducer/src/models/behavior_model.dart';
import 'package:ducer/src/models/registered_incidences_model.dart';


class BehaviorChartController extends GetxController {
  List<charts.Series<BehaviorModel, String>> _data;

  @override
  void onInit() async {
    super.onInit();
    _data = List<charts.Series<BehaviorModel, String>>();
  }

  void generateData(RegisteredIncidencesModel rim) {

    final incidenceRecordings = [
      BehaviorModel(quantityOfIncidence: rim.feelingWatched, order: '1'), 
      BehaviorModel(quantityOfIncidence: rim.communiactionTrouble, order: '2'), 
      BehaviorModel(quantityOfIncidence: rim.anxious, order: '3'),
      BehaviorModel(quantityOfIncidence: rim.sad, order: '4'),
      BehaviorModel(quantityOfIncidence: rim.anormalPhysycSignal, order: '5'),
      BehaviorModel(quantityOfIncidence: rim.isolate, order: '6'),
      BehaviorModel(quantityOfIncidence: rim.lackAttention, order: '7'),
      BehaviorModel(quantityOfIncidence: rim.tantrums, order: '8'),
      BehaviorModel(quantityOfIncidence: rim.aggressions, order: '9'),
      BehaviorModel(quantityOfIncidence: rim.problematicEnviroment, order: '10'),
    ]; 

    _data.clear();

    _data.add(
       charts.Series<BehaviorModel, String>(
        id: 'Incidences',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (BehaviorModel behavior, _) => behavior.order,
        measureFn: (BehaviorModel behavior, _) => behavior.quantityOfIncidence,
        data: incidenceRecordings,
      )
    );
  }

  List<charts.Series<BehaviorModel, String>> get data => _data;
}