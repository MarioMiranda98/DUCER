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
                _buildHeader(),
                _buildBody(_),
              ],
            ),
          ),
        ) 
      ),
    );
  }

  Widget _buildBody(RegisterChildController controller) {
    return SizedBox(
      height: Get.height * 0.7,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _buildInputsSection(),
          _buildCalendarPickerSection(),
          _buildSwitchSection(controller),
          controller.doesChildGoToPsychologist ? 
            _buildListTile(controller)
          : Container(),
          _buildButton(controller),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: DucerHeader(
        childName: '',
        screenName: 'Registrar niño',
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.grey
      )
    );
  }

  Widget _buildButton(RegisterChildController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DucerButton(
        action: () {
          _onRegisterChild(controller);
        },
        colorButton: Theme.of(Get.context).primaryColor,
        text: 'Registrar',
        colorText: Colors.white,
        fontSize: 20.0,
        width: Get.width * 0.9,
      ),
    );
  }

  Widget _buildInputsSection() {
    return Column(
      children: <Widget> [
        _createInput(_nameController, 'Nombre', false, true, true),
        _createInput(_firstLastNameController, 'Apellido paterno', false, true, true),
        _createInput(_secondLastNameController, 'Apellido materno', false, true, true),
      ]
    );
  }

  Widget _buildCalendarPickerSection() {
    return Column(
      children: <Widget> [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: _buildText('Fecha de nacimiento')
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05, 
            vertical: 15.0 
          ),
          child: CalendarPickerWidget()
        ),
      ]
    );
  }

  Widget _buildSwitchSection(RegisterChildController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildText('¿Tiene diagnósticado algún problema?'),
          CustomSwitch(
            value: controller.doesChildGoToPsychologist,
            activeColor: Theme.of(Get.context).primaryColor,
            onChanged: (value) {
              controller.doesChildGoToPsychologist = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(RegisterChildController controller) {
    return Column(
        children: controller.listTile,
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