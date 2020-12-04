import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/state_manager.dart';

import 'package:ducer/src/controllers/behavior_chart_controller.dart';

class BehaviorChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetBuilder<BehaviorChartController>(
     init: BehaviorChartController(),
     builder: (_) => charts.LineChart(
       _.data,
        defaultRenderer: new charts.LineRendererConfig(
          includeArea: true, stacked: false),
        animate: false,
     ),
   );
  }
}