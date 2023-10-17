// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:app_inventario/models/software.dart';
import 'package:app_inventario/views/widget/CampoFila.dart';
import 'package:app_inventario/views/widget/botones.dart';
import 'package:flutter/material.dart';

import '../../utils/colores.dart';
import '../../utils/responsiveApp.dart';
import '../../utils/variables.dart';

class SoftwareView extends StatefulWidget {
  final String responsable;
  final String area;
  final String nombreMaquina;
  final String trabajador;
  final String usuarioMaquina;
  const SoftwareView({
    required this.responsable,
    required this.area,
    required this.nombreMaquina,
    required this.trabajador,
    required this.usuarioMaquina,
    super.key,
  });

  @override
  State<SoftwareView> createState() => _SoftwareViewState();
}

class _SoftwareViewState extends State<SoftwareView> {
  List<TableRow> navegadores = [];
  List<TextEditingController> navegadorControllers = [];
  List<TextEditingController> nuevoControllers = [];
  TextEditingController sOController = TextEditingController();
  TextEditingController antivirusController = TextEditingController();
  TextEditingController officeController = TextEditingController();
  TextEditingController autoCadController = TextEditingController();
  Software software = Software();
  List<String> data = [];
  String x = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AzulApp,
        title: const Text(
          "Software",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    border: TableBorder.all(),
                    /*columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(0.5),
                      2: FlexColumnWidth(2),
                    },*/
                    children: [
                      nuevaFila(
                        responsiveApp,
                        "Sistema Operativo",
                        sOController,
                      ),
                      nuevaFila(
                        responsiveApp,
                        "Antivirus",
                        antivirusController,
                      ),
                      nuevaFila(
                        responsiveApp,
                        "Office",
                        officeController,
                      ),
                      nuevaFila(
                        responsiveApp,
                        "AutoCad",
                        autoCadController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(2),
                      //2: FlexColumnWidth(2),
                    },
                    children: [
                      ...navegadores,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AzulApp),
                ),
                onPressed: () {
                  // Add a new browser controller
                  setState(() {
                    TextEditingController newController =
                        TextEditingController();
                    navegadorControllers.add(newController);
                    TextEditingController new2Controller =
                        TextEditingController();
                    nuevoControllers.add(new2Controller);
                    navegadores.add(nuevaFila2(
                        responsiveApp,
                        navegadores.isEmpty ? "Navegador" : "",
                        newController,
                        new2Controller));
                  });
                },
                child: const Text(
                  "Agregar campos",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AzulApp),
                ),
                onPressed: () {
                  if (widget.responsable.isEmpty ||
                      widget.area.isEmpty ||
                      widget.trabajador.isEmpty ||
                      widget.nombreMaquina.isEmpty ||
                      widget.usuarioMaquina.isEmpty) {
                    String camposFaltantes = "";

                    if (widget.responsable.isEmpty) {
                      camposFaltantes += 'Responsable, ';
                    }
                    if (widget.area.isEmpty) {
                      camposFaltantes += 'Área, ';
                    }
                    if (widget.trabajador.isEmpty) {
                      camposFaltantes += 'Trabajador, ';
                    }
                    if (widget.nombreMaquina.isEmpty) {
                      camposFaltantes += 'Nombre de la Máquina, ';
                    }
                    if (widget.usuarioMaquina.isEmpty) {
                      camposFaltantes += 'Usuario de la Máquina, ';
                    }

                    // Elimina la última coma y espacio
                    camposFaltantes = camposFaltantes.substring(
                        0, camposFaltantes.length - 2);

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Campo Vacío'),
                          content: Text(
                              'El campo "$camposFaltantes" no puede estar vacío.'),
                          actions: <Widget>[
                            ModernButton(
                              text: "Ok",
                              iconData: Icons.save,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    for (int i = 0; i < nuevoControllers.length; i++) {
                      setState(() {
                        x = "${navegadorControllers[i].text} : ${nuevoControllers[i].text}";
                      });
                      data.add(x);
                    }

                    software = Software(
                      sistema: sOController.text,
                      antivirus: antivirusController.text,
                      office: officeController.text,
                      autocad: autoCadController.text,
                      extras: data.toString(),
                    );
                    Map<String, dynamic> datos = {
                      "responsable": widget.responsable,
                      "area": widget.area,
                      "trabajador": widget.trabajador,
                      "nombreMaquina": widget.nombreMaquina,
                      "usuarioMaquina": widget.usuarioMaquina,
                      "datos": software.toJson()
                    };

                    String jsonData = jsonEncode(datos);
                    print(jsonData);
                    dtRef.child("Software").push().set(datos).then(
                      (value) {
                        Navigator.of(context).pop();
                        FocusScope.of(context).unfocus();
                      },
                    );
                  }
                },
                child: const Text(
                  "Guardar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  TableRow nuevaFila(ResponsiveApp responsiveApp, String campo,
      TextEditingController controller) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CampoFila(
              responsiveApp: responsiveApp,
              campo: campo,
              controller: controller),
        )
      ],
    );
  }

  TableRow nuevaFila2(ResponsiveApp responsiveApp, String campo,
      TextEditingController controller1, TextEditingController controller2) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: responsiveApp.hp(8),
            child: TextField(
              inputFormatters: soloLetras,
              textCapitalization: TextCapitalization.characters,
              controller: controller1,
              decoration: InputDecoration(
                labelText: campo /* $index*/,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: responsiveApp.hp(8),
            width: responsiveApp.wp(30),
            child: TextField(
              inputFormatters: soloLetras,
              textCapitalization: TextCapitalization.characters,
              controller: controller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
