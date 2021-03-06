import 'package:ducer/src/utils/tests_results.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/pages/result_test_page.dart';
import 'package:ducer/src/controllers/test_resolve_controller.dart';
import 'package:ducer/src/pages/test_resolve/widgets/question_widget.dart';

class TestResolvePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestResolveController>(
      init: TestResolveController(),
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: DucerAppBar(),
          body: Column(
            children: <Widget> [
              _buildHeader(_),
              _buildQuestionList(_),
              _buildButton(_)
            ],
          ),
        )
      ),
    );
  }

  Widget _buildHeader(TestResolveController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: DucerHeader(
        childName: 'Realizando Test',
        screenName: controller.testName,
      ),
    );
  }

  Widget _buildQuestionList(TestResolveController controller) {
    return Container(
      width: Get.width * 0.95,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0)
      ),
      height: Get.height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: _buildQuestions(controller),
        )
      ),
    );
  }

  List<Widget> _buildQuestions(TestResolveController controller) {
    List<Widget> aux = List();

    for(int i = 0; i < controller.questions.length; i++) 
      aux.add(QuestionWidget(
        question: controller.questions[i], 
        controllerValueIndex: i,
        childProblem: controller.selectedValues[i].childProblem,
      ));

    return aux;
  }

  Widget _buildButton(TestResolveController controller) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: DucerButton(
        action: () {
          final res = TestResults.instance.calculateResult(
              controller.testIdentifier, controller.selectedValues);
          Get.offAll(
            ResultTestPage(
              testName: controller.testName,
              testIdentifier: controller.testIdentifier,
              results: res,
            ), 
            transition: Transition.fadeIn
          ); 
        },
        colorButton: Theme.of(Get.context).primaryColor,
        colorText: Colors.white,
        fontSize: 24.0,
        text: 'Aceptar',
        width: Get.width * 0.9,
      ),
    );
  }
}