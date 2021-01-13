import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/models/incidences_model.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/utils/validators.dart';
import 'package:ducer/src/data/enums/incidences_enum.dart';
import 'package:ducer/src/pages/home_page.dart';
import 'package:ducer/src/models/children_model.dart';

class RegisterIncidenceController extends GetxController {
  ChildrenModel _child;
  List<CheckboxListTile> _checkBoxOptions = new List();
  List<IncidencesModel> _incidences = [
    IncidencesModel(incidenceName: 'Se peleó en la escuela', isChecked: false, order: 0),
    IncidencesModel(incidenceName: 'Me gritó', isChecked: false, order: 1),
    IncidencesModel(incidenceName: 'Fue grocero', isChecked: false, order: 2),
    IncidencesModel(incidenceName: 'Lloraba', isChecked: false, order: 3),
    IncidencesModel(incidenceName: 'No hizo tarea', isChecked: false, order: 4),
    IncidencesModel(incidenceName: 'Más callado de lo normal', isChecked: false, order: 5),
    IncidencesModel(incidenceName: 'Se aisla', isChecked: false, order: 6),
    IncidencesModel(incidenceName: 'Se tocaba', isChecked: false, order: 7),
  ];

  List<IncidencesModel> _selectedIncidences = new List();

  @override
  void onInit() {
    super.onInit();

    if(_incidences.length > 0)
      _createCheckboxList();
  }

  ChildrenModel get child => _child;
  List<CheckboxListTile> get checkBoxOptions => _checkBoxOptions; 

  set child(ChildrenModel value) {
    _child = value;

    update(['child-name']);
    update(['incidences-menu']);
  }

  void _createCheckboxList() {
    _incidences.forEach((item) => {
      _checkBoxOptions.add(
        CheckboxListTile(
          value: item.isChecked,
          title: Text(
            item.incidenceName,
            style: TextStyle(
              fontSize: 16
            )
          ),
          activeColor: Theme.of(Get.context).primaryColor,
          onChanged: (value) {
            item.isChecked = value;
            _updateChecks(item);
          },
        ),
      )
    });
  }

  void _updateChecks(IncidencesModel item) {
    _selectedIncidences.add(item);

    _incidences.removeAt(item.order);
    _incidences.insert(item.order, item);

    _checkBoxOptions.clear();
    _createCheckboxList();

    update(['incidences-menu']);
  }

  void registerIncidences(String text) {
    final validateIncidences = Validators.validateIncidence(text, _selectedIncidences);

    if(validateIncidences == null) {
      Helpers.openSnackBar(IncidencesEnum.SUCCESS.title, IncidencesEnum.SUCCESS.message);
      Future.delayed(Duration(seconds: 3), () {
        Get.offAll(HomePage(), transition: Transition.cupertino);
      });
    } else {
      Helpers.openSnackBar(validateIncidences.title, validateIncidences.message);
    }
  }
}