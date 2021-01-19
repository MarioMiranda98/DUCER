import 'package:ducer/src/controllers/test_resolve_controller.dart';
import 'package:ducer/src/models/question_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/controllers/question_controller.dart';

// ignore: must_be_immutable
class QuestionWidget extends StatelessWidget {
  final String question;
  final int controllerValueIndex;
  final String childProblem;

  QuestionWidget({
    this.question,
    this.controllerValueIndex,
    this.childProblem
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      global: false,
      init: QuestionController(),
      builder: (_) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            _buildQuestionText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTrueTile(_),
                _buildFalseTile(_)
              ]
            )
          ]
        ),
      ),
    );
  }

  Widget _buildQuestionText() {
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        question,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey
        ),
      ),
    );
  }

  Widget _buildTrueTile(QuestionController controller) {
    final TestResolveController testResolveController = Get.find();

    return Container(
      width: 175.0,
      child: CheckboxListTile(
        value: controller.isTrue,
        activeColor: Theme.of(Get.context).primaryColor,
        title: Text(
          'Verdadero',
          style: TextStyle(
            fontSize: 14,
          )
        ),
        onChanged: (value) {
          if(!controller.isTrue) {
            controller.isTrue = value;
            var aux = testResolveController.selectedValues;
            aux.removeAt(controllerValueIndex);
            aux.insert(controllerValueIndex, QuestionResponseModel(
              questionIndex: controllerValueIndex,
              response: true,
              childProblem: childProblem,
            ));
            testResolveController.selectedValues = aux;
          }
        },
      ),
    );
  }

  Widget _buildFalseTile(QuestionController controller) {
    final TestResolveController testResolveController = Get.find();

    return Container(
      width: 150.0,
      child: CheckboxListTile(
        value: controller.isFalse,
        activeColor: Theme.of(Get.context).primaryColor,
        title: Text(
          'Falso',
          style: TextStyle(
            fontSize: 14,
          )
        ),
        onChanged: (value) {
          if(!controller.isFalse)
            controller.isFalse = value;
            var aux = testResolveController.selectedValues;
            aux.removeAt(controllerValueIndex);
            aux.insert(controllerValueIndex, QuestionResponseModel(
              questionIndex: controllerValueIndex,
              response: false,
              childProblem: childProblem
            ));
            testResolveController.selectedValues = aux;
        },
      ),
    );
  }
}