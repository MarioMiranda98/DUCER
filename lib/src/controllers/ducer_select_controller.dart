import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/models/children_model.dart';

class DucerSelectController extends GetxController {
  List<ChildrenModel> _childrenList = [
    ChildrenModel(name: 'Pedrito Lopex', selected: true, order: 0),
    ChildrenModel(name: 'Pedrito Lopex 2', selected: false, order: 1),
    ChildrenModel(name: 'Pedrito Lopex 3', selected: false, order: 2),
  ];

  List<CheckboxListTile> _listTile = new List();
  ChildrenModel _selectedChild;

  @override
  void onInit() {
    super.onInit();
    _checkChildsAvailable();
  }

  void _checkChildsAvailable() {
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
            item.name,
            style: TextStyle(
              fontSize: 16,
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