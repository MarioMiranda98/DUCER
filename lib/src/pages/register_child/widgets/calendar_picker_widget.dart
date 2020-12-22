import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/controllers/calendar_picker_controller.dart';
import 'package:ducer/src/controllers/register_child_controller.dart';

// ignore: must_be_immutable
class CalendarPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 216.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            children: <Widget>[
              _buildSelects(),
              _buildButton(context),
            ]
          ),
        ),
        _buildDateText(),
      ],
    );
  }

  Widget _buildDateText() {
    return GetBuilder<CalendarPickerController>(
      builder: (_) => Text(
        'Fecha seleccionada ${_.day}-${_.month}-${_.year}',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey
        ),
      ),
    );
  }

  Widget _buildSelects() {
    return Container(
      height: 162.0,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            height: 162.0,
            width: Get.width * 0.29,
            child: _buildDayColumn(),
          ),
          Container(
            height: 162.0,
            width: Get.width * 0.303,
            child: _buildMonthColumn(),
          ),
          Container(
            height: 162.0,
            width: Get.width * 0.3,
            child: _buildYearColumn(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    RegisterChildController registerChildController = Get.find();
    return GetBuilder<CalendarPickerController>(
      builder: (_) => Container(
        child: DucerButton(
          action: () {
            registerChildController.day = _.day;
            registerChildController.month = _.monthIndex + 1;
            registerChildController.year = _.year;
            _.update();
          },
          width: double.infinity,
          padding: 0.0,
          margin: 0.0,
          fontSize: 24.0,
          text: 'Seleccionar',
          colorButton: Theme.of(context).primaryColor,
          colorText: Colors.white,
        )
      ),
    );
  }

  Widget _buildDayColumn() {
    return GetBuilder<CalendarPickerController>(
      id: 'days',
      init: CalendarPickerController(),
      builder: (_) => Column(
        children: <Widget>[
          _buildIconButton(Icons.arrow_drop_up, _.addDay),
          Text('${_.day}',
            style: TextStyle(fontSize: 24.0),
          ),
          _buildIconButton(Icons.arrow_drop_down, _.subDay),
        ],
      ),
    );
  }

  Widget _buildMonthColumn() {
     return GetBuilder<CalendarPickerController>(
      id: 'months',
      builder: (_) => Column(
        children: <Widget>[
          _buildIconButton(Icons.arrow_drop_up, _.nextMonth),
          Text(_.month,
            style: TextStyle(fontSize: 24.0),
          ),
          _buildIconButton(Icons.arrow_drop_down, _.prevMonth),
        ],
      ),
    );
  }

    Widget _buildYearColumn() {
     return GetBuilder<CalendarPickerController>(
      id: 'year',
      builder:(_) => Column(
        children: <Widget>[
          _buildIconButton(Icons.arrow_drop_up, _.addYear),
          Text( '${_.year}',
            style: TextStyle(fontSize: 24.0),
          ),
          _buildIconButton(Icons.arrow_drop_down, _.subYear),
        ],
    ),
     );
  }

  Widget _buildIconButton(IconData icon, Function() onPressed) {
    return IconButton(
      color: Theme.of(Get.context).primaryColor,
      icon: Icon(icon,
        color: Theme.of(Get.context).primaryColor,
      ),
      onPressed: onPressed,
      iconSize: 50.0
    );
  }
}