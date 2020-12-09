import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import 'package:ducer/src/pages/login_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    this.goToLoginPage();
  }

  void goToLoginPage() {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(LoginPage(), transition: Transition.cupertino);
    });
  }
}