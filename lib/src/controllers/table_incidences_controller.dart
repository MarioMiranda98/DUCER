import 'package:get/get.dart';

import 'package:ducer/src/models/behavior_model.dart';

class TableIncidencesContoller extends GetxController {
  List<BehaviorModel> _behaviorList = [
    BehaviorModel(quantityOfIncidence: 10, date: '10-10-2010'),
    BehaviorModel(quantityOfIncidence: 10, date: '10-10-2010'),
    BehaviorModel(quantityOfIncidence: 10, date: '10-10-2010'),
  ];

  List<BehaviorModel> get behaviorList => this._behaviorList;
}