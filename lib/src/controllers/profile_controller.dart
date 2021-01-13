import 'package:ducer/src/pages/home_page.dart';
import 'package:get/get.dart';

import 'package:ducer/src/data/services/user_service.dart';
import 'package:ducer/src/data/services/secure_storage_service.dart';
import 'package:ducer/src/utils/helpers.dart';

class ProfileController extends GetxController {
  String _name;
  String _firstLastName;
  String _secondLastName;

  @override
  void onInit() {
    super.onInit();
    _getParentData();
  }

  Future<void> _getParentData() async {
    final userService = UserService.instance;
    final res = await userService.getUserInfo(
      email: await SecureStorageService.instance.getUserEmail(),
    );

    if(res != null) {
      _name = res.name;
      _firstLastName = res.firstLastName;
      _secondLastName = res.secondLastName;
      update();
    } else {
      Helpers.openSnackBar('Error', 'No se pudo obtener la informacion');
      Future.delayed(Duration(seconds: 3), () {
        Get.offAll(HomePage(), transition: Transition.cupertino);
      });
    }
  }

  String get name => this._name;
  String get firstLastName => this._firstLastName;
  String get secondLastName => this._secondLastName;
}