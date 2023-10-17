import 'package:app_inventario/models/software.dart';
import 'package:app_inventario/utils/variables.dart';
import 'package:flutter/material.dart';

class InventarioDetalle extends StatefulWidget {
  const InventarioDetalle({super.key});

  @override
  State<InventarioDetalle> createState() => _InventarioDetalleState();
}

class _InventarioDetalleState extends State<InventarioDetalle> {
  Software software = Software();
  List<Software> listaSoftware = [];
  @override
  void initState() {
    super.initState();
  }

  obtenerDatos() {
    dtRef.child("Software").onChildAdded.listen((data) {
      var sof = Software.fromJsons(data.snapshot.value as Map);
      listaSoftware.add(sof);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: listaSoftware.map((e) => Text(e.antivirus!)).toList(),
      ),
    );
  }
}
