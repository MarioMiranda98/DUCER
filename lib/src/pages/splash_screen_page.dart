import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/controllers/splash_screen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: FractionallySizedBox(
                      widthFactor: 0.6,
                      child: Image.asset('assets/logos/iconoA.png'))),
              SizedBox(height: Get.height * 0.05),
              SizedBox(
                width: Get.width * 0.25,
                height: Get.height * 0.15,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor
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
