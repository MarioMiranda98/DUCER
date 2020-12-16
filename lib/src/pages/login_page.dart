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
                  Container(
                    height: 180.0,
                    child: Image.asset('assets/logos/icono_letrasA.png'),
                  ),
                  DucerTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    obscureText: false,
                    onChanged: null,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 15.0),
                  DucerTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    obscureText: true,
                    onChanged: null,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DucerButton(
                        text: 'Log in',
                        width: 140.0,
                        colorText: Colors.white,
                        fontSize: 18,
                        colorButton: Theme.of(Get.context).primaryColor,
                        action: () => _.onSignIn(
                            _emailController.text, _passwordController.text),
                      ),
                      DucerButton(
                        text: 'Crear cuenta',
                        width: 140.0,
                        colorText: Colors.white,
                        fontSize: 18,
                        colorButton: Theme.of(Get.context).primaryColor,
                        action: () => _.toCreateAccount(),
                      )
                    ],
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
