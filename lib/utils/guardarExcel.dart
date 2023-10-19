import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path_pack;

import '../models/inventario.dart';

Future<void> saveExcelFile(
    List<Inventario>? inventario, BuildContext context) async {
  String excelFileName = await showFileNameDialog(context);
  if (excelFileName.isNotEmpty) {
    final path = await FilePicker.platform.getDirectoryPath();
    if (path != null) {
      Excel excel = crearExcel(inventario);

      // Guarda el archivo Excel en la ubicación seleccionada por el usuario
      final excelFile = excel.encode();
      final excelPath = path_pack.join(path, "$excelFileName.xlsx");
      final file = File(excelPath);
      await file.writeAsBytes(excelFile!);

      print('Archivo Excel guardado en: $excelPath');
    }
  }
}

Excel crearExcel(List<Inventario>? inventarioLista) {
  final excel = Excel.createExcel();
  final sheet = excel['Sheet1'];

  // Agrega datos a la hoja de cálculo
  //sheet.appendRow(['Nombre', 'Edad']);
  inventarioLista!.map((inventario) {
    sheet.appendRow(['Responsable', inventario.responsable!]);
    sheet.appendRow(['Área', inventario.area!]);
    sheet.appendRow(['Nombre Máquina', inventario.nombreMaquina!]);
    sheet.appendRow(['Usuario Máquina', inventario.usuarioMaquina!]);
    //for (int i = 0; i < inventario.hardware!.length; i++) {}
    sheet.appendRow([""]);
    sheet.appendRow(["HARDWARE"]);
    inventario.hardware!.map((e) {
      String campos = e.contenido!.campos!;
      //esto reemplaza los [] con ""
      String reemplazo = campos.replaceAll(RegExp(r'[\[\]]'), '');
      // Divide la cadena en una lista de cadenas utilizando la coma como delimitador
      List<String> stringList = reemplazo.split(', ');

      sheet.appendRow([e.hardware]);
      if (e.hardware == "Case") {
        if (e.contenido!.patrimonial!.isNotEmpty) {
          sheet.appendRow([
            "",
            "PATRIMONIAL",
            e.contenido!.patrimonial!,
            "PROCESADOR",
            e.contenido!.procesador!
          ]);
        }
        if (e.contenido!.marca!.isNotEmpty) {
          sheet.appendRow([
            "",
            "MARCA",
            e.contenido!.marca!,
            "MEMORIA",
            e.contenido!.memoria!
          ]);
        }
        if (e.contenido!.modelo!.isNotEmpty) {
          sheet.appendRow([
            "",
            "MODELO",
            e.contenido!.modelo!,
            "DISCO DURO",
            e.contenido!.disco!
          ]);
        }
        if (e.contenido!.serie!.isNotEmpty) {
          sheet.appendRow([
            "",
            "SERIE",
            e.contenido!.serie!,
            "TARJETA VIDEO",
            e.contenido!.tarjeta!
          ]);
        }
      } else {
        if (e.contenido!.modelo!.isNotEmpty) {
          sheet.appendRow([
            "",
            "PATRIMONIAL",
            e.contenido!.patrimonial!,
            "MODELO",
            e.contenido!.modelo!
          ]);
        }
        if (e.contenido!.serie!.isNotEmpty) {
          sheet.appendRow(
              ["", "MARCA", e.contenido!.marca!, "SERIE", e.contenido!.serie!]);
        }
      }
      for (String item in stringList) {
        // Divide cada elemento de la lista en una lista de campos
        List<String> fieldList = item.split(': ');

        if (fieldList.length == 2) {
          String fieldName = fieldList[0];
          String fieldValue = fieldList[1];

          sheet.appendRow([
            "",
            fieldName,
            fieldValue,
          ]);
        }
      }
      sheet.appendRow(["OBSERVACIONES", e.observacion]);
      sheet.appendRow([""]);
    }).toList();

    sheet.appendRow([""]);
    sheet.appendRow(["SOFTWARE"]);
    sheet.appendRow(["", "SISTEMA OPERATIVO", inventario.software!.sistema!]);
    sheet.appendRow(["", "ANTIVIRUS", inventario.software!.antivirus!]);
    sheet.appendRow(["", "OFFICE", inventario.software!.office!]);
    sheet.appendRow(["", "AUTOCAD", inventario.software!.autocad!]);
    inventario.software!.extras;

    String camposSof = inventario.software!.extras!;
    //esto reemplaza los [] con ""
    String reemplazoSoft = camposSof.replaceAll(RegExp(r'[\[\]]'), '');
    // Divide la cadena en una lista de cadenas utilizando la coma como delimitador
    List<String> stringListSof = reemplazoSoft.split(', ');
    for (String item in stringListSof) {
      // Divide cada elemento de la lista en una lista de campos
      List<String> fieldList = item.split(': ');

      if (fieldList.length == 2) {
        String fieldName = fieldList[0];
        String fieldValue = fieldList[1];
        sheet.appendRow([
          "",
          fieldName,
          fieldValue,
        ]);
      }
    }
  }).toList();

  return excel;
}

showFileNameDialog(BuildContext context) async {
  String fileName = "";

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Nombre del archivo Excel'),
        content: TextField(
          onChanged: (value) {
            fileName = value;
          },
          decoration: const InputDecoration(
            hintText: 'Ejemplo',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Guardar'),
            onPressed: () {
              Navigator.of(context).pop(fileName);
            },
          ),
        ],
      );
    },
  );
}
