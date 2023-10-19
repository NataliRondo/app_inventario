// ignore_for_file: file_names

import 'package:app_inventario/utils/guardarExcel.dart';
import 'package:app_inventario/views/inventario_detalle.dart';
import 'package:app_inventario/views/registro_view.dart';
import 'package:app_inventario/views/widget/botones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/inventario.dart';
import '../utils/colores.dart';
import '../utils/variables.dart';

class InventarioView extends StatefulWidget {
  const InventarioView({super.key});

  @override
  State<InventarioView> createState() => _InventarioViewState();
}

class _InventarioViewState extends State<InventarioView> {
  List<Inventario>? inventarioLista = [];
  @override
  void initState() {
    super.initState();
    obtenerDatosSoftware();
  }

  obtenerDatosSoftware() {
    dtRef.child("Inventario").onChildAdded.listen((data) {
      var inventario = Inventario.fromJson(data.snapshot.value as Map);
      inventarioLista!.add(inventario);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Inventario',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AzulApp,
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AzulApp),
        ),
        onPressed: () async {
          final registro = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RegistroView(),
            ),
          );

          if (registro != null) {
            obtenerDatosSoftware();
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: inventarioLista!.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Center(
                        child: Text("No hay datos"),
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: inventarioLista!
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    InventarioDetalle(inventario: e),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text("Responsable :${e.responsable!}"),
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Nombre Maquina: ${e.nombreMaquina!}"),
                                      Text(
                                          "Nombre usuario: ${e.usuarioMaquina!}"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
      ),
      persistentFooterButtons: [
        ModernButton(
            text: "Exportar",
            onPressed: () {
              saveExcelFile(inventarioLista, context);
            },
            iconData: Icons.adf_scanner)
      ],
    );
  }
}
