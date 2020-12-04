import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import 'package:ducer/src/pages/home_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    this.goToHomePage();
  }

  void goToHomePage() {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(HomePage(), transition: Transition.cupertino);
    });
  }
}