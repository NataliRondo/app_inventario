import 'package:flutter/material.dart';

import '../utils/colores.dart';

class SoftwareView extends StatefulWidget {
  final String area;
  final String nombreMaquina;
  final String trabajador;
  final String usuarioMaquina;
  const SoftwareView({
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
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
