import 'package:ducer/src/controllers/dashboard_controller.dart';
import 'package:ducer/src/widgets/ducer_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/pages/dashboard/widgets/behavior_chart.dart';
import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/models/behavior_model.dart';
import 'package:ducer/src/pages/dashboard/widgets/light_widget.dart';
import 'package:ducer/src/pages/dashboard/widgets/table_incidences_widget.dart';

class DashboardPage extends StatelessWidget {
  final text = 'Eu esse sint eiusmod eiusmod consectetur occaecat minim elit reprehenderit deserunt proident id.';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DucerAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: GetBuilder<DashboardController>(
                  id: 'child-name',
                  init: DashboardController(),
                  builder: (_) => DucerHeader(
                    childName: _.childName == null ? 'Selecciona niño' : _.childName,
                    screenName: 'Estatus',
                  ),
                ),
              ),
              GetBuilder<DashboardController>(
                id: 'dashboard-body',
                builder: (_) => Container(
                  height: Get.height * 0.7,
                  child: Stack(
                    children: <Widget> [ 
                      _.childName != null ?
                        SizedBox(
                          height: Get.height,
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'Registro de conductas',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18
                                  )
                                ),
                              ),
                              Container(
                                height: 300.0,
                                child: BehaviorChart()
                              ),
                              TableIncidencesWidget(
                                behaviorList: [
                                  BehaviorModel(quantityOfIncidence: 10, date: '10-10-2010'),
                                  BehaviorModel(quantityOfIncidence: 10, date: '10-10-2010'),
                                  BehaviorModel(quantityOfIncidence: 10, date: '10-10-2010'),
                                ]
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Semáforo',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18
                                    )
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                                height: 150.0,
                                child: LightWidget()
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  top: 10.0, 
                                  left: Get.width * 0.05, 
                                  right: Get.width * 0.05  
                                ),
                                child: Column(
                                  children: <Widget> [
                                    Text(
                                      'Observaciones',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey
                                      ),
                                    ),
                                    Text(
                                      text,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    )
                                  ]
                                ),
                              ),
                              SizedBox(height: 75.0)
                            ],
                          ),
                        )
                      : Container(
                        padding: EdgeInsets.only(left: Get.width * 0.28),
                        child: Text(
                          'Selecciona tu niño',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey
                          ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _.childName != null ? Get.height * 0.62 : Get.height * 0.2),
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

                              _.childName = selectedChild.name;
                            },
                          ),
                      ),
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
}