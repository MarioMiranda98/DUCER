import 'package:ducer/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/utils/validators.dart';
import 'package:ducer/src/data/enums/child_enums.dart';

class RegisterChildController extends GetxController {
  bool _doesChildGoToPsychologist = false;
  String _selectedDiagnosis;

  int _day;
  int _month;
  int _year;

  List<String> _diagnosis = [
    'Depresion',
    'TDA',
    'Hiperactividad',
  ];

  Map<String, bool> _diagnosisValues = {
    'Depresion' : true,
    'TDA' : false,
    'Hiperactividad' : false,
  };

  List<CheckboxListTile> listTile = new List();

  @override
  void onInit() {
    super.onInit();
    _createTile();
    _selectedDiagnosis = 'Ninguna';
    _day = 1;
    _month = 1;
    _year = 2000;
  }

  void onRegisterChild(Map<String, dynamic> childForm) {
    bool isCorrect = true;

    final validateName = Validators.validateFields(childForm['name']);
    final validateFirstLastName = Validators.validateFields(childForm['firstLastName']);
    final validateSecondLastName = Validators.validateFields(childForm['secondLastName']);

    if(validateName != null) {
      Helpers.openSnackBar(validateName.title, validateName.message);
      isCorrect = false;
    }

    if(validateFirstLastName != null && isCorrect) {
      Helpers.openSnackBar(validateFirstLastName.title, validateFirstLastName.message);
      isCorrect = false;
    }

    if(validateSecondLastName != null && isCorrect) {
      Helpers.openSnackBar(validateSecondLastName.title, validateSecondLastName.message);
      isCorrect = false;
    }

    if(isCorrect) {
      Helpers.openSnackBar(ChildEnums.SUCCESS_REGISTER.title, ChildEnums.SUCCESS_REGISTER.message);
      Future.delayed((Duration(seconds: 3)), () {
        Get.off(HomePage(), transition: Transition.fade);
      });
    }
  }

  bool get doesChildGoToPsychologist => this._doesChildGoToPsychologist;
  int get day => this._day;
  int get month => this._month;
  int get year => this._year;

  set doesChildGoToPsychologist(bool value) {
    this._doesChildGoToPsychologist = value;
    
    if(!value) {
      _diagnosisValues[_diagnosis[0]] = true;
      _updateChecks(_diagnosis[0]);
    }

    update();
  }

  set day(int value) {
    this._day = value;
  }

  set month(int value) {
    this._month = value;
  }

  set year(int value) {
    this._year = value;
  }

  void _createTile() {
    _diagnosis.forEach((item) => {
      listTile.add(
        CheckboxListTile(
          value: _diagnosisValues[item],
          title: Text(
            item,
            style: TextStyle(
              fontSize: 16,
            )
          ),
          activeColor: Theme.of(Get.context).primaryColor,
          onChanged: (value) {
            if(_diagnosisValues[item] != true) {
              _diagnosisValues[item] = value;
              _updateChecks(item);
            }
          },
        )
      )
    });
  }

  void _updateChecks(String item) {
    _selectedDiagnosis = item;

    _diagnosis.forEach((e) => {
      if(e != item) _diagnosisValues[e] = false,
    });

    listTile.clear();
    _createTile();

    update();
  }
}