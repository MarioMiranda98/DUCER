import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/models/behavior_model.dart';

class TableIncidencesWidget extends StatelessWidget {
  final List<BehaviorModel> behaviorList;

  TableIncidencesWidget({
    this.behaviorList
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: DataTable(
        sortColumnIndex: 1,
        sortAscending: false,
        columns: [
          DataColumn(label: Text(
            'Día (Eje x)',
            style: TextStyle(
              color: Colors.grey
            ),  
          )),
          DataColumn(label: Text(
            'Incidencias (Eje y)',
            style: TextStyle(
              color: Colors.grey
            ),
          )),
        ],
        rows: _createRows(),
      ),
    );
  }

  List<DataRow> _createRows() {
    List<DataRow> data = new List();

    behaviorList.forEach((item) => {
      data.add(DataRow(
        selected: false,
        cells: [
          DataCell(Text(item.date)),
          DataCell(Text('${item.quantityOfIncidence}'))
        ]
      ))
    });

    return data;
  }
}