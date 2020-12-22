import 'package:custom_switch/custom_switch.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/ducer_text_field.dart';
import 'package:ducer/src/controllers/register_child_controller.dart';
import 'package:ducer/src/pages/register_child/widgets/calendar_picker_widget.dart';

// ignore: must_be_immutable
class RegisterChildPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _firstLastNameController = TextEditingController();
  TextEditingController _secondLastNameController = TextEditingController();

  void _onRegisterChild(RegisterChildController controller) {
    controller.onRegisterChild(
      <String, dynamic> {
        'name': _nameController.text,
        'firstLastName': _firstLastNameController.text,
        'secondLastName': _secondLastNameController.text
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DucerAppBar(),
        body: GetBuilder<RegisterChildController>(
          init: RegisterChildController(),
          builder: (_) => SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: DucerHeader(
                    childName: '',
                    screenName: 'Registrar niño',
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.7,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      _createInput(_nameController, 'Nombre', false, true, true),
                      _createInput(_firstLastNameController, 'Apellido paterno', false, true, true),
                      _createInput(_secondLastNameController, 'Apellido materno', false, true, true),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Fecha de nacimiento',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05, 
                          vertical: 15.0 
                        ),
                        child: CalendarPickerWidget()
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '¿Va al psicologo?',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey
                              ),
                            ),
                            CustomSwitch(
                              value: _.doesChildGoToPsychologist,
                              activeColor: Theme.of(context).primaryColor,
                              onChanged: (value) {
                                _.doesChildGoToPsychologist = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      _.doesChildGoToPsychologist ? 
                        Container(
                          child: Column(
                            children: _.listTile,
                          ),
                        )
                      :
                        Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: DucerButton(
                          action: () {
                            _onRegisterChild(_);
                          },
                          colorButton: Theme.of(context).primaryColor,
                          text: 'Registrar',
                          colorText: Colors.white,
                          fontSize: 20.0,
                          width: Get.width * 0.9,
                        ),
                      ),
                      SizedBox(height: 10.0)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) 
      ),
    );
  }

  Widget _createInput(TextEditingController controller, String labelText, bool obscureText, bool interaction, bool enabled) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: DucerTextField(
        controller: controller,
        labelText: labelText,
        obscureText: obscureText,
        onChanged: null,
        textInputType: TextInputType.text,
        enableInteractiveSelection: interaction,
        enabled: enabled,
      ),
    );
  }
}