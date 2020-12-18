import 'package:ducer/src/pages/register_incidence/widgets/incidences_menu_widget.dart';
import 'package:ducer/src/widgets/ducer_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/controllers/register_incidence_controller.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/widgets/ducer_select.dart';

// ignore: must_be_immutable
class RegisterIncidencePage extends StatelessWidget {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DucerAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: GetBuilder<RegisterIncidenceController>(
                  id: 'child-name',
                  init: RegisterIncidenceController(),
                  builder: (_) => DucerHeader(
                    childName: 'Pedrito Lopex',
                    screenName: '¿Qué pasó?',
                  ),
                ),
              ),
              GetBuilder<RegisterIncidenceController>(
                id: 'incidences-menu',
                builder: (_) => Container(
                  height: Get.height * 0.7,
                  child: Stack(
                    children: <Widget>[
                      _.childName != null ?
                        SizedBox(
                          height: Get.height,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                            child: ListView(
                              children: <Widget>[
                                IncidencesMenuWidget(
                                  checkBoxOptions: _.checkBoxOptions,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: _createRegisterIncidence(_)
                                ),
                                SizedBox(height: 75.0)
                              ],
                            ),
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
                              
                              if(selectedChild != null) _.childName = selectedChild.name;
                            },
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),         
        )
      )
    );
  }

  Row _createRegisterIncidence(RegisterIncidenceController controller) {
    return Row(
      children: <Widget>[
        Container(
          width: 200.0,
          child: DucerTextField(
            controller: textController,
            enableInteractiveSelection: false,
            enabled: true,
            labelText: 'Registrar otro',
            obscureText: false,
            onChanged: null,
            textInputType: TextInputType.text,
          ),
        ),
        DucerButton(
          text: 'Registrar',
          fontSize: 18,
          width: 84.0,
          colorText: Colors.white,
          colorButton: Theme.of(Get.context).primaryColor,
          action: () => { controller.registerIncidences(textController.text) },
        ),
      ],
    );
  }
}