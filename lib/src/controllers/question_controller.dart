import 'package:get/get.dart';

class QuestionController extends GetxController {
  bool _isTrue = true;
  bool _isFalse = false;

  bool get isTrue => this._isTrue;
  bool get isFalse => this._isFalse;

  set isTrue(bool value) {
    this._isTrue = value;

    if(this._isTrue) this._isFalse = false;

    update();
  }

  set isFalse(bool value) {
    this._isFalse = value;

    if(this._isFalse) this._isTrue = false;

    update();
  }
}