// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../models/software.dart';

Card widgetSoftware(Software? soft) {
  String campos = soft!.extras!;
  //esto reemplaza los [] con ""
  String reemplazo = campos.replaceAll(RegExp(r'[\[\]]'), '');
  // Divide la cadena en una lista de cadenas utilizando la coma como delimitador
  List<String> stringList = reemplazo.split(', ');
  List<TableRow>? tableRows = [];
  //debugPrint(campos);
  //debugPrint(reemplazo);
  //print(stringList);
  for (String item in stringList) {
    // Divide cada elemento de la lista en una lista de campos
    List<String> fieldList = item.split(': ');

    if (fieldList.length == 2) {
      String fieldName = fieldList[0];
      String fieldValue = fieldList[1];

      // Crea un TableRow con los campos y añádelo a la lista de TableRow

      tableRows.add(TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(fieldName),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(fieldValue),
            ),
          ),
        ],
      ));
    }
  }
  return Card(
    child: ListTile(
      title: const Text(
        "Software",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(),
                columnWidths: const {0: FlexColumnWidth(1)},
                children: [
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Antivirus "),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(soft.antivirus!),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Autocad"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(soft.autocad!),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Office"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(soft.office!),
                      ),
                    ],
                  ),
                  ...tableRows,
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
