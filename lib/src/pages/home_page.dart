import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';

import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/widgets/ducer_text_field.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/widgets/behavior_chart.dart';

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
            DucerTextField(
              controller: TextEditingController(),
              labelText: 'Email',
              obscureText: false,
              onChanged: (value) => { print(value) },
              textInputType: TextInputType.emailAddress,
            ),
            DucerTextField(
              controller: TextEditingController(),
              labelText: 'Password',
              obscureText: true,
              onChanged: (value) => { print(value) },
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            DucerButton(
              action: () => print('hello'),
              colorButton: Color(0xFF275850),
              colorText: Colors.white,
              margin: 15.0,
              padding: 20.0,
              text: 'Log in',
              width: 100.0,
            ),
            SizedBox(height: 10),
            DucerButton(
              action: () async => print(await Helpers.buildDatePicker()),
              colorButton: Color(0xFF275850),
              colorText: Colors.white,
              margin: 15.0,
              padding: 20.0,
              text: 'Date Picker',
              width: 100.0,
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              child: BehaviorChart(),
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Y -> No. Incidencias'),
                  Text('X -> Días')
                ]
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Switch'),
                  CustomSwitch(
                    activeColor: Colors.green[300],
                    value: true,
                    onChanged: (value) {
                      print(value);
                    }
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}