import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidencesMenuWidget extends StatelessWidget {
  final List<CheckboxListTile> checkBoxOptions;

  IncidencesMenuWidget({
    this.checkBoxOptions
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: checkBoxOptions,
      ),
    );
  }
}