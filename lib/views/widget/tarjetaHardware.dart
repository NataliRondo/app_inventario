// ignore_for_file: file_names

import 'package:app_inventario/utils/colores.dart';
import 'package:app_inventario/views/widget/botones.dart';
import 'package:app_inventario/views/widget/CampoFila.dart';
import 'package:app_inventario/views/widget/campo_Observacion.dart';
import 'package:app_inventario/views/widget/campo_fila_Hardware.dart';
import 'package:flutter/material.dart';

import '../../utils/responsiveApp.dart';
import '../../utils/variables.dart';

class TarjetaHardware extends StatefulWidget {
  const TarjetaHardware({
    super.key,
    required this.nombre,
    required this.responsiveApp,
    required this.patrimonialController,
    required this.procesadorController,
    required this.marcaController,
    required this.memoriaController,
    required this.modeloController,
    required this.discoDuroController,
    required this.serieController,
    required this.tarjVideoController,
    this.campoController,
    this.observacionController,
    this.campo,
  });
  final String nombre;
  final String? campo;
  final TextEditingController? campoController;
  final ResponsiveApp responsiveApp;
  final TextEditingController patrimonialController;
  final TextEditingController procesadorController;
  final TextEditingController marcaController;
  final TextEditingController memoriaController;
  final TextEditingController modeloController;
  final TextEditingController discoDuroController;
  final TextEditingController serieController;
  final TextEditingController tarjVideoController;
  final TextEditingController? observacionController;

  @override
  State<TarjetaHardware> createState() => _TarjetaHardwareState();
}

class _TarjetaHardwareState extends State<TarjetaHardware> {
  List<String> listaCampoFila = [];
  @override
  Widget build(BuildContext context) {
    return Card(
      color: FondoApp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.nombre,
              style: estilos(
                widget.responsiveApp,
                4,
                Colors.black,
                FontWeight.bold,
                FontStyle.normal,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.responsiveApp.dp(5),
            ),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(0.3),
                2: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  children: [
                    CampoFila(
                      responsiveApp: widget.responsiveApp,
                      campo: "Patrimonial",
                      controller: widget.patrimonialController,
                    ),
                    SizedBox(
                      width: widget.responsiveApp.wp(3),
                    ),
                    CampoFila(
                      responsiveApp: widget.responsiveApp,
                      campo: "Procesador",
                      controller: widget.procesadorController,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CampoFila(
                      responsiveApp: widget.responsiveApp,
                      campo: "Marca",
                      controller: widget.marcaController,
                    ),
                    SizedBox(
                      width: widget.responsiveApp.wp(3),
                    ),
                    CampoFila(
                      responsiveApp: widget.responsiveApp,
                      campo: "Memoria",
                      controller: widget.memoriaController,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CampoFila(
                      responsiveApp: widget.responsiveApp,
                      campo: "Modelo",
                      controller: widget.modeloController,
                    ),
                    SizedBox(
                      width: widget.responsiveApp.wp(3),
                    ),
                    CampoFila(
                      responsiveApp: widget.responsiveApp,
                      campo: "Disco Duro",
                      controller: widget.discoDuroController,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CampoFila(
                      responsiveApp: widget.responsiveApp,
                      campo: "Serie",
                      controller: widget.serieController,
                    ),
                    SizedBox(
                      width: widget.responsiveApp.wp(3),
                    ),
                    CampoFila(
                      responsiveApp: widget.responsiveApp,
                      campo: "Tarjeta de Video",
                      controller: widget.tarjVideoController,
                    ),
                  ],
                ),
                /*...listaCampoFila
                    .map(
                      (e) => TableRow(
                        children: [
                          CampoFilaHardware(
                            responsiveApp: widget.responsiveApp,
                            controller1: widget.campoController,
                            controller2: widget.campoController,
                          ),
                          SizedBox(
                            width: widget.responsiveApp.wp(3),
                          ),
                          CampoFilaHardware(
                            responsiveApp: widget.responsiveApp,
                            controller1: widget.campoController,
                            controller2: widget.campoController,
                          ),
                        ],
                      ),
                    )
                    .toList(),*/
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: widget.responsiveApp.dp(5),
              right: widget.responsiveApp.dp(5),
              top: widget.responsiveApp.dp(3),
            ),
            child: ModernButton(
              text: "Agregar campo",
              onPressed: () async {
                setState(() {
                  listaCampoFila.add(widget.campo!);
                });
              },
              iconData: Icons.add,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CampoObservacion(
              responsiveApp: widget.responsiveApp,
              campo: "Observación:",
              controller: widget.observacionController,
            ),
          ),
        ],
      ),
    );
  }
}
