// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';
import 'package:app_inventario/models/software.dart';

List<Usuario> usuarioFromJson(String str) =>
    List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
  String? area;
  Software? datos;
  
  String? nombreMaquina;
  String? responsable;
  String? trabajador;
  String? usuarioMaquina;

  Usuario({
    this.area,
    this.datos,
    this.nombreMaquina,
    this.responsable,
    this.trabajador,
    this.usuarioMaquina,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      area: json["area"],
      datos: json["datos"] == null ? null : Software.fromJson(json["datos"]),
      nombreMaquina: json["nombreMaquina"],
      responsable: json["responsable"],
      trabajador: json["trabajador"],
      usuarioMaquina: json["usuarioMaquina"],
    );
  }

  Usuario.fromJsons(Map<dynamic, dynamic> json) {
    area = json["area"];
    datos = json["datos"] == null ? null : Software.fromJsons(json["datos"]);
    nombreMaquina = json["nombreMaquina"];
    responsable = json["responsable"];
    trabajador = json["trabajador"];
    usuarioMaquina = json["usuarioMaquina"];
  }

  Map<String, dynamic> toJson() => {
        "area": area,
        "datos": datos?.toJson(),
        "nombreMaquina": nombreMaquina,
        "responsable": responsable,
        "trabajador": trabajador,
        "usuarioMaquina": usuarioMaquina,
      };
}
