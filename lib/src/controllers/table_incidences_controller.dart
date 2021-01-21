import 'package:get/get.dart';

import 'package:ducer/src/models/behavior_model.dart';

class TableIncidencesContoller extends GetxController {
  List<BehaviorModel> _behaviorList = [
    BehaviorModel(quantityOfIncidence: 10, order: 'Se siente observado'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Le cuesta comunicarse'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Se nota ansioso'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Se nota triste'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Señal física anormal'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Se aísla'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Poca atención'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Rabietas'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Agresión'),
    BehaviorModel(quantityOfIncidence: 10, order: 'Problematico en su ent.'),
  ];

  List<BehaviorModel> get behaviorList => this._behaviorList;
}