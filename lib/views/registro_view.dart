// ignore_for_file: avoid_print

import 'package:app_inventario/models/hardware.dart';
import 'package:app_inventario/models/software.dart';
import 'package:app_inventario/utils/colores.dart';
import 'package:app_inventario/utils/responsiveApp.dart';
import 'package:app_inventario/views/hardware_View.dart';
import 'package:app_inventario/views/software_View.dart';
import 'package:app_inventario/views/widget/botones.dart';
import 'package:app_inventario/views/widget/input_widget.dart';
import 'package:app_inventario/views/widget/widget_Software.dart';
import 'package:app_inventario/views/widget/widget_hardware.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/variables.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  TextEditingController responsableController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController trabajadorController = TextEditingController();
  TextEditingController nombreMaquinaController = TextEditingController();
  TextEditingController usuarioMaquinaController = TextEditingController();
  Map<String, dynamic>? software;
  Software? soft;
  List<Hardware>? hardwareLista;
  List<Map<String, dynamic>>? hardware;

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AzulApp,
        title: const Text(
          "Registro Inventario",
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveApp.wp(4),
                  vertical: responsiveApp.hp(2),
                ),
                child: Column(
                  children: [
                    inputWidget(
                      campo: "Responsable",
                      controller: responsableController,
                    ),
                    inputWidget(
                      campo: "Área",
                      controller: areaController,
                    ),
                    inputWidget(
                      campo: "Trabajador",
                      controller: trabajadorController,
                    ),
                    inputWidget(
                      campo: "Nombre de máquina",
                      controller: nombreMaquinaController,
                    ),
                    inputWidget(
                      campo: "Usuario de máquina",
                      controller: usuarioMaquinaController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModernButton(
                      text: "Hardware",
                      onPressed: () async {
                        final hard = await Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => HardwareView(
                              responsable: responsableController.text,
                              area: areaController.text,
                              trabajador: trabajadorController.text,
                              nombreMaquina: nombreMaquinaController.text,
                              usuarioMaquina: usuarioMaquinaController.text,
                            ),
                          ),
                        );
                        if (hard != null) {
                          setState(() {
                            hardware = hard[0];
                            hardwareLista = hard[1];
                          });
                        }
                      },
                      iconData: Icons.hardware,
                    ),
                    SizedBox(
                      width: responsiveApp.dp(3),
                    ),
                    ModernButton(
                      text: "Software",
                      onPressed: () async {
                        final softwa = await Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SoftwareView(
                              responsable: responsableController.text,
                              area: areaController.text,
                              trabajador: trabajadorController.text,
                              nombreMaquina: nombreMaquinaController.text,
                              usuarioMaquina: usuarioMaquinaController.text,
                            ),
                          ),
                        );

                        if (softwa != null) {
                          setState(() {
                            software = softwa![0];
                            soft = softwa![1];
                            //software = soft;
                          });
                        }
                      },
                      iconData: Icons.personal_video_outlined,
                    ),
                  ],
                ),
              ),
              if (hardwareLista != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Hardware"),
                      ...hardwareLista!.map((e) => widgetHardware(e, context)),
                    ],
                  ),
                ),
              if (soft != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Software"),
                      widgetSoftware(soft),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ModernButton(
            text: "Guardar",
            onPressed: () async {
              if (responsableController.text.isEmpty ||
                  areaController.text.isEmpty ||
                  trabajadorController.text.isEmpty ||
                  nombreMaquinaController.text.isEmpty ||
                  usuarioMaquinaController.text.isEmpty) {
                String camposFaltantes = "";
                if (responsableController.text.isEmpty) {
                  camposFaltantes += 'Responsable, ';
                }
                if (areaController.text.isEmpty) {
                  camposFaltantes += 'Área, ';
                }
                if (trabajadorController.text.isEmpty) {
                  camposFaltantes += 'Trabajador, ';
                }
                if (nombreMaquinaController.text.isEmpty) {
                  camposFaltantes += 'Nombre de la Máquina, ';
                }
                if (usuarioMaquinaController.text.isEmpty) {
                  camposFaltantes += 'Usuario de la Máquina, ';
                }

                // Elimina la última coma y espacio
                camposFaltantes =
                    camposFaltantes.substring(0, camposFaltantes.length - 2);

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
              } else if (software == null || hardware == null) {
                String camposFaltantes = "";
                if (software == null) {
                  camposFaltantes += 'Software, ';
                }
                if (hardware == null) {
                  camposFaltantes += 'Hardware, ';
                }

                // Elimina la última coma y espacio
                camposFaltantes =
                    camposFaltantes.substring(0, camposFaltantes.length - 2);

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
                /**/ Map<String, dynamic> datos = {
                  "responsable": responsableController.text,
                  "area": areaController.text,
                  "trabajador": trabajadorController.text,
                  "nombreMaquina": nombreMaquinaController.text,
                  "usuarioMaquina": usuarioMaquinaController.text,
                  "hardware": hardware,
                  "software": software
                };
                /*print(hardware);
                print("******************");
                print(software);
                print("******************");
                print(datos);
                print("******************");
                */
                dtRef.child("Inventario").push().set(datos).then(
                  (value) {
                    Navigator.of(context).pop();
                    /*showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Campo Vacío'),
                          content: const Text('Se registro con exito'),
                          actions: <Widget>[
                            ModernButton(
                              text: "Ok",
                              iconData: Icons.save,
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  responsableController.clear();
                                  areaController.clear();
                                  trabajadorController.clear();
                                  nombreMaquinaController.clear();
                                  usuarioMaquinaController.clear();
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );*/
                  },
                );
              }
            },
            iconData: Icons.save)
      ],
    );
  }
}
