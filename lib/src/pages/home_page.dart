import 'package:flutter/material.dart';

import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/behavior_chart.dart';
import 'package:ducer/src/widgets/ducer_header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DucerAppBar(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            DucerHeader(
              childName: 'Pedrito Lopez',
              screenName: 'Registrar Conducta'
            ),
            SizedBox(
              width: 300,
              height: 180,
              child: BehaviorChart()
            )
          ],
        ),
      ),
    );
  }
}