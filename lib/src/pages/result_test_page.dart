import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/pages/home_page.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/widgets/ducer_app_bar.dart';

class ResultTestPage extends StatelessWidget {
  final String testName;
  final String lorem = 'Tempor do laboris quis est sit id deserunt magna proident. ' +
                       'Tempor do laboris quis est sit id deserunt magna proident. ' +
                       'Tempor do laboris quis est sit id deserunt magna proident. ' +
                       'Tempor do laboris quis est sit id deserunt magna proident. ' +
                       'Tempor do laboris quis est sit id deserunt magna proident. ' +
                       'Tempor do laboris quis est sit id deserunt magna proident. ' +
                       'Tempor do laboris quis est sit id deserunt magna proident. ' +
                       'Tempor do laboris quis est sit id deserunt magna proident.';

  ResultTestPage({
    this.testName
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: DucerAppBar(),
          body: Column(
            children: <Widget> [
              _buildHeader(),
              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.7,
                child: ListView(
                  shrinkWrap:true,
                  children: [
                    _buildImage(),
                    _buildText(),
                    _buildButton(),
                    SizedBox(height: 10.0)
                  ]
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: DucerHeader(
        childName: 'Test realizado: $testName',
        screenName: 'Resultado',
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: Get.height * 0.3,
      child: Image.asset(
        'assets/images/kenshiro.jpg',
      ),
    );
  }

  Widget _buildText() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: Get.width * 0.9,
      child: Text(
        lorem,
        style: TextStyle(
          fontSize: 18
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: DucerButton(
        action: () => { 
          Get.off(
            HomePage(), 
            transition: Transition.fadeIn
          ) 
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