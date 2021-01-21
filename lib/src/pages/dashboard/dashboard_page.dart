import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/pages/dashboard/widgets/behavior_chart.dart';
import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/controllers/dashboard_controller.dart';
import 'package:ducer/src/widgets/ducer_select.dart';
import 'package:ducer/src/pages/dashboard/widgets/light_widget.dart';
import 'package:ducer/src/pages/dashboard/widgets/table_incidences_widget.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DucerAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildHeader(),
              GetBuilder<DashboardController>(
                id: 'dashboard-body',
                builder: (_) => Container(
                  height: Get.height * 0.7,
                  child: Stack(
                    children: <Widget> [ 
                      _.childName != null ?
                      _buildBody(_)
                      : _buildSubTitleText('Selecciona Tu Niño'),
                      _buildButton(_),
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );    
  }
  
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: GetBuilder<DashboardController>(
        id: 'child-name',
        init: DashboardController(),
        builder: (_) => DucerHeader(
          childName: _.childName == null ? 'Selecciona niño' : _.childName,
          screenName: 'Estatus',
        ),
      ),
    );
  }

  Widget _buildBody(DashboardController controller) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        _buildBehaviorRegister(controller),
        _buildLights(),
        _buildGeneralComments(controller),
        SizedBox(height: 75.0)
      ],
    );
  }

  Widget _buildSubTitleText(String text) {
    return Center(
      child: Text(text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18
        )
      ),
    );
  }

  Widget _buildButton(DashboardController controller) {
    return Padding(
      padding: EdgeInsets.only(top: controller.childName != null ? Get.height * 0.62 : Get.height * 0.2),
      child: DucerButton(
        colorButton: Theme.of(Get.context).primaryColor,
        colorText: Colors.white,
        text: 'Seleccionar niño',
        width: Get.width * 0.9,
        fontSize: 24,
        action: () async {
          final selectedChild = await showDialog(
            context: Get.context,
            builder: (BuildContext context) {
              return DucerSelect();
            }
          );
          if(selectedChild != null && selectedChild.name.length > 0) controller.childName = '${selectedChild.name} ${selectedChild.firstLastName} ${selectedChild.secondLastName}';
          else controller.childName = null;
        },
      ),
    );
  }

  Widget _buildBehaviorRegister(DashboardController controller) {
    return Column(
      children: <Widget> [
        _buildSubTitleText('Registro de conductas'),
        Container(
          height: 300.0,
          child: controller.isChartReady ? 
            BehaviorChart() : 
            SizedBox(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(Get.context).primaryColor
                  ),
                ),
              ),
            )
        ),
        TableIncidencesWidget(),
      ]
    );
  }

  Widget _buildLights() {
    return Column(
      children: <Widget> [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildSubTitleText('Semáforo')
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          height: 150.0,
          child: LightWidget()
        ),
      ],
    );
  }

  Widget _buildGeneralComments(DashboardController controller) {
    return Column(
      children: <Widget> [
        Container(
          padding: EdgeInsets.only(
            top: 10.0, 
            left: Get.width * 0.05, 
            right: Get.width * 0.05  
          ),
          child: Column(
            children: <Widget> [
             _buildSubTitleText('Observaciones'),
              Text(controller.suggestion,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              )
            ]
          ),
        ),
      ],
    );
  }
}