import 'package:get/get.dart';

import 'package:ducer/src/pages/login_page.dart';
import 'package:ducer/src/data/services/secure_storage_service.dart';
import 'package:ducer/src/pages/home_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    this.goToLoginPage();
  }

  void goToLoginPage() async {
    final userEmail = await SecureStorageService.instance.getUserEmail();
    Future.delayed(Duration(seconds: 3), () {
      if(userEmail == null) Get.off(LoginPage(), transition: Transition.cupertino);
      else Get.off(HomePage(), transition: Transition.leftToRight);
    });
  }
}