import 'package:ducer/src/models/test_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/widgets/ducer_select.dart';
import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/controllers/available_test_controller.dart';
import 'package:ducer/src/pages/available_tests/widgets/test_tile_widget.dart';

class AvailableTestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AvailableTestController>(
      init: AvailableTestController(),
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: DucerAppBar(),
          body: Column(
            children: <Widget> [
              _buildHeader(_),
              _.childName != null ? _buildBody(_) : Container(),
              _buildButton(_)
            ],
          )
        ),
      ),
    );
  }

  Widget _buildHeader(AvailableTestController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: DucerHeader(
        childName: (controller.childName != null ? 
                    controller.childName 
                    : 'Selecciona Niño'),
        screenName: 'Realizar Test',
      ),
    );
  }

  Widget _buildBody(AvailableTestController controller) {
    return Container(
      width: Get.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: _buildTestList(controller.availableTests),
      ),
    );
  }

  Widget _buildButton(AvailableTestController controller) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: DucerButton(
        action: () async {
          final selectedChild = await showDialog(
            context: Get.context,
            builder: (BuildContext context) {
              return DucerSelect();
            }
          );

          if(selectedChild != null) controller.childName = selectedChild.name;
        },
        colorButton: Theme.of(Get.context).primaryColor,
        colorText: Colors.white,
        fontSize: 24.0,
        text: 'Seleccionar Niño',
        width: Get.width * 0.9,
      ),
    );
  }

  List<Widget> _buildTestList(List<TestModel> testModelList) {
    List<Widget> aux = new List();

    testModelList.forEach((item) => {
      aux.add(
        TestTileWidget(
          identifier: item.indentifier,
          titleTest: item.titleTest,
          status: item.status,
          destinationPage: item.destinationPage,
        )
      )
    });

    return aux;
  }
}