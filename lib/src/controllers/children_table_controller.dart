import 'package:get/get.dart';

class ChildrenTableController extends GetxController {
  List<String> _childrenName = List<String>();

  @override
  void onInit() {
    super.onInit();
    _childrenName.add('Pedrito Lopex');
    _childrenName.add('Pedrito Lopex 2');
    _childrenName.add('Pedrito Lopex 3');
  }

  List<String> get childrenName => this._childrenName;
}