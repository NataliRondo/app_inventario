// ignore_for_file: no_logic_in_create_state

import 'package:app_inventario/models/inventario.dart';
import 'package:flutter/material.dart';

import '../utils/colores.dart';

class InventarioDetalle extends StatefulWidget {
  final Inventario? inventario;
  const InventarioDetalle({super.key, required this.inventario});

  @override
  State<InventarioDetalle> createState() => _InventarioDetalleState(inventario);
}

class _InventarioDetalleState extends State<InventarioDetalle> {
  Inventario? inventario;
  _InventarioDetalleState(this.inventario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Inventario ${inventario!.nombreMaquina!}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AzulApp,
      ),
      body: Center(
        child: inventario == null
            ? Container()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        TableRow(
                          children: [
                            const Text("Responsable"),
                            Text(inventario!.responsable!),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Área"),
                            Text(inventario!.area!),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Nombre Maquina"),
                            Text(inventario!.nombreMaquina!),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Usuario maquina"),
                            Text(inventario!.usuarioMaquina!),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ...inventario!.hardware!
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hardware: ${e.hardware!}"),
                                  ListTile(
                                    title: const Text("Contenido"),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Procesador: ${e.contenido!.procesador}"),
                                          Text(
                                              "Patrimonial: ${e.contenido!.patrimonial}"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Table(
                              border: TableBorder.all(),
                              children: [
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Office"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(inventario!.software!.office!),
                                    )
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Antivirus"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          inventario!.software!.antivirus!),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
