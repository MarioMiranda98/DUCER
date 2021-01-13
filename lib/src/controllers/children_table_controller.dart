import 'package:get/get.dart';

import 'package:ducer/src/data/services/child_service.dart';
import 'package:ducer/src/data/services/secure_storage_service.dart';
import 'package:ducer/src/models/children_model.dart';

class ChildrenTableController extends GetxController {
  List<ChildrenModel> _childrenName = List<ChildrenModel>();

  @override
  void onInit() {
    super.onInit();
    _getChildrenList();
  }

  Future<void> _getChildrenList() async {
    final childService = ChildService.instance;
    final res = await childService.getAllChildren(
      email: await SecureStorageService.instance.getUserEmail()
    );

    if(res != null && res.length > 0) {
      var aux = true;
      var c;
      for(int i = 0; i < res.length; i++) {
        c = ChildrenModel.fromJson(res[i]);
        c.selected = aux;
        c.order = i;
        aux = false;
        _childrenName.add(c);
      }
    }

    update();
    return;
  }

  List<ChildrenModel> get childrenName => this._childrenName;
}