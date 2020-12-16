import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/controllers/create_account_controller.dart';
import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/widgets/ducer_text_field.dart';

// ignore: must_be_immutable
class CreateAccountPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _firstLastNameController = TextEditingController();
  TextEditingController _secondLastNameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _onSignIn(CreateAccountController controller, bool isManSelected, bool isWomanSelected) {
    controller.validateInputs(
      <String, dynamic> { 
        'name': _nameController.text,
        'firstLastName': _firstLastNameController.text,
        'secondLastName': _secondLastNameController.text,
        'birthDate': _birthDateController.text,
        'isManSelected': isManSelected,
        'isWomanSelected': isWomanSelected,
        'email': _emailController.text,
        'password': _passwordController.text,
        'confirmPassword': _confirmPasswordController.text
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(
      id: 'create-account',
      init: CreateAccountController(),
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: DucerAppBar(),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _createInput(_nameController, 'Nombre', false, true, true),
                  _createInput(_firstLastNameController, 'Apellido Paterno', false, true, true),
                  _createInput(_secondLastNameController, 'Apellido Materno', false, true, true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Container(
                        width: 200.0,
                        child: _createInput(_birthDateController, 'Fecha de nacimiento', false, false, false)
                      ),
                      DucerButton(
                        action: () async {
                          final aux = await Helpers.buildDatePicker();
                          aux != null ? 
                            _birthDateController.text = aux.toString().split(' ')[0]
                          :
                            _birthDateController.text = '';
                        },
                        colorButton: Theme.of(context).primaryColor,
                        colorText: Colors.white,
                        fontSize: 16,
                        text: 'Seleccionar',
                        width: 100.0,
                      ),
                    ]
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text('Selecciona tu género',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Get.height * 0.020
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        child: CheckboxListTile(
                          value: _.isMan,
                          title: Text('Hombre', style: TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            _.isMan = value;
                          },
                          activeColor: Theme.of(context).primaryColor,
                        )
                      ),
                      Container(
                        width: 150.0,
                        child: CheckboxListTile(
                          value: _.isWoman,
                          title: Text('Mujer', style: TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            _.isWoman = value;
                          },
                          activeColor: Theme.of(context).primaryColor,
                        )
                      ),
                    ],
                  ),
                  _createInput(_emailController, 'Email', false, true, true),
                  _createInput(_passwordController, 'Contraseña', true, true, true),
                  _createInput(_confirmPasswordController, 'Confirma tu contraseña', true, true, true),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DucerButton(
                      action: () => _onSignIn(_, _.isMan, _.isWoman),
                      colorButton: Theme.of(context).primaryColor,
                      fontSize: 20,
                      colorText: Colors.white,
                      text: 'Registrarse',
                      width: 175.0,
                    ),
                  ),
                ],
              ),
            ),
          ),      
        ),
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