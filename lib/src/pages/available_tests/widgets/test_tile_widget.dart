import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/controllers/test_resolve_controller.dart';

class TestTileWidget extends StatelessWidget {
  final controller = Get.put(TestResolveController()); 

  final String identifier;
  final String titleTest;
  final Widget destinationPage;

  TestTileWidget({
    this.identifier,
    this.titleTest = 'Default',
    @required this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 71.0,
      padding: EdgeInsets.symmetric(vertical: 10.0), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _createTestText(),
          _createButton(context),
        ],
      ),
    );
  }

  Widget _createTestText() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Text(
        this.titleTest,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey
        )
      ),
    );
  }

  Widget _createButton(BuildContext context) {
    return Container(
      child: DucerButton(
        colorButton: Theme.of(context).primaryColor,
        colorText: Colors.white,
        text: 'Ir',
        fontSize: 18.0,
        width: 50.0,
        action: () { 
          controller.testName = this.titleTest;
          controller.testIdentifier = this.identifier;
          Get.to(destinationPage);
        },
      ),
    );
  }
}