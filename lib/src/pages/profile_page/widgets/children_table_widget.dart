import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/controllers/children_table_controller.dart';

class ChildrenTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenTableController>(
      init: ChildrenTableController(),
      builder: (_) => Container(
        child: DataTable(
          sortAscending: false,
          sortColumnIndex: 1,
          columns: [
            DataColumn(label: Text(
              'Niños',
              style: TextStyle(
                color: Colors.grey
                ),  
              )),
            DataColumn(label: Text(
              'Acciones',
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

  List<DataRow> _createRows(ChildrenTableController controller) {
    List<DataRow> aux = List();

    controller.childrenName.forEach((item) => {
      aux.add(DataRow(
        selected: false,
        cells: [
          DataCell(Text(item)),
          DataCell(_buildButton(item)),
        ]
      ))
    });

    return aux;
  }

  Widget _buildButton(String childName) {
    return Container(
      child: DucerButton(
        action: () => print(childName),
        colorButton: Theme.of(Get.context).primaryColor,
        colorText: Colors.white,
        fontSize: 12.0,
        text: 'Reporte',
        width: 60.0,
      ),
    );
  }
}