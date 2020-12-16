import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class Helpers {
  static void setStatusBarColor(Color color) async {
    await FlutterStatusbarcolor.setStatusBarColor(color);
    await FlutterStatusbarcolor.setNavigationBarWhiteForeground(
        useWhiteForeground(color));
  }

  static Future<DateTime> buildDatePicker() async {
    return await showRoundedDatePicker(
      context: Get.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10000),
      lastDate: DateTime(DateTime.now().year + 10000),
      borderRadius: 16,
      theme: ThemeData(
        primaryColor: Theme.of(Get.context).primaryColor,
        accentColor: Theme.of(Get.context).primaryColor,
        dialogBackgroundColor: Colors.grey[200],
        accentTextTheme: TextTheme(
          bodyText2: TextStyle(color: Theme.of(Get.context).primaryColor)
        )
      )
    );
  }

  static void openSnackBar(String errorTitle, String errorBody) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        errorTitle,
        style: TextStyle(
          fontFamily: 'Baloo',
          color: Theme.of(Get.context).primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      messageText: Text(
        errorBody,
        style: TextStyle(
          fontFamily: 'Baloo',
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey.withOpacity(0.4),
      animationDuration: Duration(seconds: 5)
    );
  }
}