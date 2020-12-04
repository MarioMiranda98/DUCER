import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:ducer/src/models/behavior_model.dart';


class BehaviorChartController extends GetxController {
  List<charts.Series<BehaviorModel, int>> _data;

  @override
  void onInit() {
    super.onInit();
    _data = List<charts.Series<BehaviorModel, int>>();
    _generateData();
  }

  void _generateData() {
     final incidenceRecordings = [
      BehaviorModel(quantityOfIncidence: 30, date: '0'), 
      BehaviorModel(quantityOfIncidence: 10, date: '1'), 
      BehaviorModel(quantityOfIncidence: 15, date: '2'),
      BehaviorModel(quantityOfIncidence: 18, date: '3'),
      BehaviorModel(quantityOfIncidence: 9, date: '4'),
      BehaviorModel(quantityOfIncidence: 15, date: '5'),
      BehaviorModel(quantityOfIncidence: 10, date: '6'),
    ];

    _data.add(
       charts.Series<BehaviorModel, int>(
        id: 'Incidences',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (BehaviorModel behavior, _) => int.parse(behavior.date),
        measureFn: (BehaviorModel behavior, _) => behavior.quantityOfIncidence,
        data: incidenceRecordings,
      )
    );
  }

  List<charts.Series<BehaviorModel, int>> get data => _data;
}