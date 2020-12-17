import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/controllers/ducer_select_controller.dart';

class DucerSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DucerSelectController>(
      init: DucerSelectController(),
      id: 'ducer-select',
      builder: (_) => AlertDialog(
        title: Text(
          'Selecciona el niño',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey
          ),
        ),
        contentPadding: EdgeInsets.only(top: 12.0),
        content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
            child: ListBody(
              children: _.listTile
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey
              ),
            ),
            onPressed: () { Navigator.pop(Get.context); },
          ),
          FlatButton(
            child: Text(
              'Aceptar',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey
              ),
            ),
            onPressed: () { Navigator.pop(Get.context, _.selectedChild); },
          )
        ],
      )
    );
  }
}