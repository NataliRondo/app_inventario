// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColor(String hex) {
    String formattedHex = "FF${hex.toUpperCase().replaceAll("#", "")}";
    return int.parse(formattedHex, radix: 16);
  }

  HexColor(final String hex) : super(_getColor(hex));
}

Color FondoApp = HexColor('#f7f7f7');
Color AzulApp = HexColor('#004b9c');
Color RojoApp = HexColor('#e30000');
Color Tema = HexColor("#162129");
//Color Whatsapp = HexColor("#128c7e");
Color Whatsapp = HexColor("#48c757");
Color colorFondo = HexColor("#004a80");
Color nuevo = Colors.indigo;
Color front = HexColor("#7FB3D5");
Color gris = HexColor("#F4F6F6");
Color Navy = HexColor("#212F3D");
Color editar = HexColor("#F7DC6F");
Color ok = HexColor("#58D68D");
Color eliminar = HexColor("#D98880");
Color grisGorel = HexColor("#737373");
Color rojo = HexColor("#FF0000");
Color nuevoNegro = HexColor("#00223B");
Color digital = HexColor("#F5EEF8");
Color tv = HexColor("#D1F2EB");
Color web = HexColor("#d9d1f2");
var impreso = Colors.grey.shade300;
