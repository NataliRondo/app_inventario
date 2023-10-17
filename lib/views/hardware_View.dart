// ignore_for_file: file_names, avoid_print
import 'dart:convert';

import 'package:app_inventario/models/hardware.dart';
import 'package:app_inventario/views/widget/CampoFila.dart';
import 'package:app_inventario/views/widget/botones.dart';
import 'package:flutter/material.dart';

import '../utils/colores.dart';
import '../utils/responsiveApp.dart';
import '../utils/variables.dart';

class HardwareView extends StatefulWidget {
  final String responsable;
  final String area;
  final String nombreMaquina;
  final String trabajador;
  final String usuarioMaquina;
  const HardwareView({
    super.key,
    required this.responsable,
    required this.area,
    required this.nombreMaquina,
    required this.trabajador,
    required this.usuarioMaquina,
  });

  @override
  State<HardwareView> createState() => _HardwareViewState();
}

class _HardwareViewState extends State<HardwareView> {
  TextEditingController modeloController = TextEditingController();
  TextEditingController discoDuroController = TextEditingController();
  TextEditingController serieController = TextEditingController();
  TextEditingController tarjVideoController = TextEditingController();

  List<TextEditingController> controllers = [];
  List<List<TextEditingController>> cardCampo1Controllers = [];
  List<List<TextEditingController>> cardCampo2Controllers = [];
  List<TextEditingController> observacionControllers = [];
  List<TextEditingController> patrimonialController = [];
  List<TextEditingController> procesadorController = [];
  List<TextEditingController> marcaController = [];
  List<TextEditingController> memoriaController = [];

  
  Hardware hardware = Hardware();
  List<Hardware> hardwareLista = [];

  List<String> data = [];

  int numberOfCards = 1; // Variable para rastrear la cantidad de cards

  @override
  void initState() {
    super.initState();
    cardCampo1Controllers.add([]);
    cardCampo2Controllers.add([]);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Registro de Hardware',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AzulApp,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView.builder(
          itemCount: controllers.length,
          itemBuilder: (context, index) {
            String cardText = index == 0
                ? "CASE"
                : index == 1
                    ? "MONITOR"
                    : index == 2
                        ? "TECLADO"
                        : index <= 3
                            ? "MOUSE"
                            : "";

            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (index == 0 || index == 1 || index == 2 || index == 3)
                      Text(
                        cardText,
                        style: estilos(
                          responsiveApp,
                          4,
                          Colors.black,
                          FontWeight.bold,
                          FontStyle.normal,
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          inputFormatters: soloLetras,
                          textCapitalization: TextCapitalization.characters,
                          controller: controllers[index],
                          decoration: const InputDecoration(
                              labelText: 'Ingresa nuevo hardware ' /* $index*/),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: responsiveApp.dp(3),
                        left: responsiveApp.dp(3),
                      ),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(0.5),
                          2: FlexColumnWidth(2),
                        },
                        children: [
                          if (index == 0 ||
                              index == 1 ||
                              index == 2 ||
                              index == 3)
                            TableRow(
                              children: [
                                CampoFila(
                                  responsiveApp: responsiveApp,
                                  campo: "Patrimonial",
                                  controller: patrimonialController[index],
                                ),
                                SizedBox(
                                  width: responsiveApp.wp(3),
                                ),
                                CampoFila(
                                  responsiveApp: responsiveApp,
                                  campo: "Procesador",
                                  controller: procesadorController[index],
                                ),
                              ],
                            )
                          else
                            TableRow(
                              children: [
                                CampoFila(
                                  responsiveApp: responsiveApp,
                                  campo: "Marca",
                                  controller: marcaController[index],
                                ),
                                SizedBox(
                                  width: responsiveApp.wp(3),
                                ),
                                CampoFila(
                                  responsiveApp: responsiveApp,
                                  campo: "Memoria",
                                  controller: memoriaController[index],
                                ),
                              ],
                            ),

                          // Agrega las filas personalizadas aquí
                          for (int i = 0;
                              i < cardCampo1Controllers[index].length;
                              i++)
                            TableRow(
                              children: [
                                Column(
                                  children: [
                                    CampoFila(
                                      responsiveApp: responsiveApp,
                                      campo: "",
                                      controller: cardCampo1Controllers[index]
                                          [i],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: responsiveApp.wp(3),
                                    ),
                                    SizedBox(
                                      width: responsiveApp.wp(3),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CampoFila(
                                      responsiveApp: responsiveApp,
                                      campo: "",
                                      controller: cardCampo2Controllers[index]
                                          [i],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: responsiveApp.dp(2),
                        right: responsiveApp.dp(3),
                        left: responsiveApp.dp(3),
                      ),
                      child: TextField(
                        inputFormatters: soloLetras,
                        textCapitalization: TextCapitalization.characters,
                        controller: observacionControllers[index],
                        decoration: InputDecoration(
                          labelText: 'Observación',
                          border: const OutlineInputBorder(),
                          labelStyle: estilos(
                            responsiveApp,
                            3,
                            Colors.black,
                            FontWeight.bold,
                            FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    // Botón para agregar nuevos TextField en la misma tabla
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AzulApp),
                      ),
                      onPressed: () {
                        setState(() {
                          cardCampo1Controllers[index]
                              .add(TextEditingController());
                          cardCampo2Controllers[index]
                              .add(TextEditingController());
                          observacionControllers.add(TextEditingController());
                        });
                      },
                      child: const Text(
                        'Agregar nuevo campo',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ModernButton(
                onPressed: () {
                  _addCard();
                },
                iconData: Icons.add,
                text: "Agregar",
              ),
              const SizedBox(width: 16.0),
              ModernButton(
                iconData: Icons.save,
                text: "Guardar",
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
                    for (int i = 0; i < controllers.length; i++) {
                      for (int j = 0;
                          j < cardCampo1Controllers[i].length;
                          j++) {
                        setState(() {
                          String valor =
                              "'${cardCampo1Controllers[i][j].text}: ${cardCampo2Controllers[i][j].text}'";
                          data.add(
                              valor); // Agrega campos a la lista específica del hardware
                        });
                      }

                      Contenido contenido = Contenido(
                        patrimonial: patrimonialController[i].text,
                        procesador: procesadorController[i].text,
                        campos: data.toString(),
                      );
                      if (i == 0) {
                        hardware = Hardware(
                            hardware: "Case",
                            contenido: contenido,
                            observacion: observacionControllers[i].text);
                      } else if (i == 1) {
                        hardware = Hardware(
                            hardware: "Monitor",
                            contenido: contenido,
                            observacion: observacionControllers[i].text);
                      } else if (i == 2) {
                        hardware = Hardware(
                            hardware: "Teclado",
                            contenido: contenido,
                            observacion: observacionControllers[i].text);
                      } else if (i == 3) {
                        hardware = Hardware(
                            hardware: "Mouse",
                            contenido: contenido,
                            observacion: observacionControllers[i].text);
                      } else {
                        hardware = Hardware(
                            hardware: controllers[i].text,
                            contenido: contenido,
                            observacion: observacionControllers[i].text);
                      }

                      hardwareLista.add(hardware);
                      //hardwareMap[hardware.hardware] = hardware;
                    }

                    Map<String, dynamic> datos = {
                      "responsable": widget.responsable,
                      "area": widget.area,
                      "trabajador": widget.trabajador,
                      "nombreMaquina": widget.nombreMaquina,
                      "usuarioMaquina": widget.usuarioMaquina,
                      "hardware": hardwareLista
                          .map((hardware) => hardware.toJson())
                          .toList()
                    };

                    String jsonData = jsonEncode(datos);
                    print(jsonData);
                    /**/ dtRef.child("Hardware").push().set(datos).then(
                      (value) {
                        Navigator.of(context).pop();
                        FocusScope.of(context).unfocus();
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  void _addCard() {
    setState(() {
      controllers.add(TextEditingController());
      cardCampo1Controllers.add([]);
      cardCampo2Controllers.add([]);
      patrimonialController.add(TextEditingController());
      procesadorController.add(TextEditingController());
      marcaController.add(TextEditingController());
      memoriaController.add(TextEditingController());
      observacionControllers.add(TextEditingController());
    });
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var controllersList in cardCampo1Controllers) {
      for (var controller in controllersList) {
        controller.dispose();
      }
    }
    for (var controllersList in cardCampo2Controllers) {
      for (var controller in controllersList) {
        controller.dispose();
      }
    }
    for (var controller in observacionControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
