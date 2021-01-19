import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/models/incidences_model.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/utils/validators.dart';
import 'package:ducer/src/data/enums/incidences_enum.dart';
import 'package:ducer/src/pages/home_page.dart';
import 'package:ducer/src/models/children_model.dart';
import 'package:ducer/src/data/services/incidences_service.dart';
import 'package:ducer/src/data/services/secure_storage_service.dart';
import 'package:ducer/src/models/registered_incidences_model.dart';

class RegisterIncidenceController extends GetxController {
  ChildrenModel _child;
  List<CheckboxListTile> _checkBoxOptions = new List();
  List<IncidencesModel> _incidences = [
    IncidencesModel(incidenceName: 'Se siente observado', isChecked: false, order: 0),
    IncidencesModel(incidenceName: 'Le cuesta comunicarse', isChecked: false, order: 1),
    IncidencesModel(incidenceName: 'Se nota ansioso', isChecked: false, order: 2),
    IncidencesModel(incidenceName: 'Se nota triste', isChecked: false, order: 3),
    IncidencesModel(incidenceName: 'Señal física anormal', isChecked: false, order: 4),
    IncidencesModel(incidenceName: 'Se aísla', isChecked: false, order: 5),
    IncidencesModel(incidenceName: 'Poca atención', isChecked: false, order: 6),
    IncidencesModel(incidenceName: 'Rabietas', isChecked: false, order: 7),
    IncidencesModel(incidenceName: 'Agresión', isChecked: false, order: 8),
    IncidencesModel(incidenceName: 'Problematico en su entorno', isChecked: false, order: 9),
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

  void registerIncidences(String text) async {
    final validateIncidences = Validators.validateIncidence(text, _selectedIncidences);

    if(validateIncidences == null) {
      final user = await SecureStorageService.instance.getUserEmail();
      final incidencesService = IncidencesService.instance;
      DateTime now = new DateTime.now();
      DateTime date = new DateTime(now.year, now.month, now.day);

      var res;
      _selectedIncidences.forEach((item) async => {
        res = await incidencesService.registerIncidence(
          body: {
            'email': user,
            'name': _child.name,
            'first_last_name': _child.firstLastName,
            'second_last_name': _child.secondLastName,
            'incidence_name': item.incidenceName,
            'incidence_date': date.toString(),
          }
        )
      });

      res = await incidencesService.getAllIncidences(
        args: [_child.name, _child.firstLastName, _child.secondLastName]
      );

      var rim = RegisteredIncidencesModel.fromJson(res[0]);

      final resp = Helpers.getNewValues(_selectedIncidences, rim.toJson());
      rim = RegisteredIncidencesModel.fromJson(resp);


      await incidencesService.updateIncidence(
        body: rim.toJson(),
        args: [_child.name, _child.firstLastName, _child.secondLastName]
      );

      Helpers.openSnackBar(IncidencesEnum.SUCCESS.title, IncidencesEnum.SUCCESS.message);
      Future.delayed(Duration(seconds: 3), () {
        Get.offAll(HomePage(), transition: Transition.cupertino);
      });
    } else {
      Helpers.openSnackBar(validateIncidences.title, validateIncidences.message);
    }
  }
}