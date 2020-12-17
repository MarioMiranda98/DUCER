import 'package:get/get.dart';

class DashboardController extends GetxController {
  String _childName;

  String get childName => _childName;

  set childName(String value) {
    _childName = value;

    update(['child-name']);
    update(['dashboard-body']);
  }
}