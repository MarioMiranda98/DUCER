import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/controllers/login_controller.dart';
import 'package:ducer/src/widgets/ducer_text_field.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100.0),
                  _createImage(),
                  _createInput(_emailController, 'Email', TextInputType.emailAddress, false),
                  SizedBox(height: 15.0),
                  _createInput(_passwordController, 'Contraseña', TextInputType.text, true),
                  SizedBox(height: 40.0),
                  _buildButtons(_)
                ]
              )
            ),
          ),
        ),
      ),
    );
  }

  Widget _createImage() {
    return Container(
      height: 180.0,
      child: Image.asset('assets/logos/icono_letrasA.png'),
    );
  }

  Widget _createInput(TextEditingController controller, String text, 
            TextInputType textInputType, bool obscureText) {

    return DucerTextField(
      controller: controller,
      labelText: text,
      obscureText: obscureText,
      onChanged: null,
      textInputType: textInputType,
    );
  }

  Widget _buildButtons(LoginController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DucerButton(
          text: 'Log in',
          width: 140.0,
          colorText: Colors.white,
          fontSize: 18,
          colorButton: Theme.of(Get.context).primaryColor,
          action: () => controller.onSignIn(
              _emailController.text, _passwordController.text),
        ),
        DucerButton(
          text: 'Crear cuenta',
          width: 140.0,
          colorText: Colors.white,
          fontSize: 18,
          colorButton: Theme.of(Get.context).primaryColor,
          action: () => controller.toCreateAccount(),
        )
      ],
    );
  }
}