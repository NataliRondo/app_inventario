// ignore: file_names
import 'package:app_inventario/models/hardware.dart';
import 'package:app_inventario/utils/responsiveApp.dart';
import 'package:flutter/material.dart';

Card widgetHardware(Hardware? hard, BuildContext context) {
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  String campos = hard!.contenido!.campos!;
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
              child: Text(
                fieldName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
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
      title: Text(
        hard.hardware!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveApp.dp(3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(1),
              },
              children: [
                if (hard.contenido!.patrimonial!.isNotEmpty)
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Patrimonial",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hard.contenido!.patrimonial!),
                      ),
                    ],
                  ),
                if (hard.contenido!.procesador!.isNotEmpty)
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Procesador ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hard.contenido!.procesador!),
                      ),
                    ],
                  ),
                if (hard.contenido!.marca!.isNotEmpty)
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Marca ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hard.contenido!.marca!),
                      ),
                    ],
                  ),
                if (hard.contenido!.memoria!.isNotEmpty)
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Memoria ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hard.contenido!.memoria!),
                      ),
                    ],
                  ),
                if (hard.contenido!.modelo!.isNotEmpty)
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Modelo ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hard.contenido!.modelo!),
                      ),
                    ],
                  ),
                if (hard.contenido!.disco!.isNotEmpty)
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Disco Duro ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hard.contenido!.disco!),
                      ),
                    ],
                  ),
                if (hard.contenido!.serie!.isNotEmpty)
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Serie ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hard.contenido!.serie!),
                      ),
                    ],
                  ),
                if (hard.contenido!.tarjeta!.isNotEmpty)
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Tarjeta de Video ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hard.contenido!.tarjeta!),
                      ),
                    ],
                  ),
                ...tableRows
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Observación:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: responsiveApp.dp(2),
                  ),
                  Text(
                    hard.observacion!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
