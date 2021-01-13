import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/models/children_model.dart';
import 'package:ducer/src/data/services/child_service.dart';
import 'package:ducer/src/data/services/secure_storage_service.dart';

class DucerSelectController extends GetxController {
  List<ChildrenModel> _childrenList = new List();

  List<CheckboxListTile> _listTile = new List();
  ChildrenModel _selectedChild;

  @override
  void onInit() {
    super.onInit();
    _getChildrenList();
  }

  Future<void> _getChildrenList() async {
    final childService = ChildService.instance;
    final res = await childService.getAllChildren(
      email: await SecureStorageService.instance.getUserEmail()
    );

    if(res != null) {
      var aux = true;
      var c;
      for(int i = 0; i < res.length; i++) {
        c = ChildrenModel.fromJson(res[i]);
        c.selected = aux;
        c.order = i;
        aux = false;
        _childrenList.add(c);
      }
    }

    _checkChildrenAvailable();
    update(['ducer-select']);
    return;
  }

  void _checkChildrenAvailable() {
    if(_childrenList.length > 0) {
      _createTile();
      _selectedChild = _childrenList[0];
    } else {
      _selectedChild = ChildrenModel(name: '', selected: false, order: 0);
    }
  }

  void _createTile() {
    _childrenList.forEach((item) => {
      _listTile.add(
        CheckboxListTile(
          value: item.selected,
          title: Text(
            '${item.name} ${item.firstLastName} ${item.secondLastName}',
            style: TextStyle(
              fontSize: 14,
            )
          ),
          activeColor: Theme.of(Get.context).primaryColor,
          onChanged: (value) {
            if(item.selected != true) {
              item.selected = value;
              _updateChecks(item);
            }
          },
        )
      )
    });
  }

  void _updateChecks(ChildrenModel item) {
    _selectedChild = item;
    _childrenList.removeAt(item.order);
    _childrenList.insert(item.order, item);

    _childrenList.forEach((e) => {
      if(item.order != e.order) e.selected = false
    }); 

    _listTile.clear();
    _createTile();

    update(['ducer-select']);
  }

  List<CheckboxListTile> get listTile => _listTile; 
  ChildrenModel get selectedChild => _selectedChild;

  set selectedChild(ChildrenModel value) {
    this._selectedChild = value;
  }
}