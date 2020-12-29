import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/controllers/question_controller.dart';

class QuestionWidget extends StatelessWidget {
  final String question;

  QuestionWidget({this.question});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
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
          if(!controller.isTrue)
            controller.isTrue = value;
        },
      ),
    );
  }

  Widget _buildFalseTile(QuestionController controller) {
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
        },
      ),
    );
  }
}