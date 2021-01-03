import 'package:ducer/src/controllers/table_incidences_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableIncidencesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableIncidencesContoller>(
      init: TableIncidencesContoller(),
      builder: (_) => Container(
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
          rows: _createRows(_),
        ),
      ),
    );
  }

  List<DataRow> _createRows(TableIncidencesContoller controller) {
    List<DataRow> data = new List();

    controller.behaviorList.forEach((item) => {
      data.add(DataRow(
        selected: false,
        cells: [
          DataCell(Text(item.date)),
          DataCell(Center(
            child: Text(
              '${item.quantityOfIncidence}'
            )
          ))
        ]
      ))
    });

    return data;
  }
}