// To parse this JSON data, do
//
//     final Inventario = InventarioFromJson(jsonString);

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:app_inventario/models/software.dart';

import 'hardware.dart';

Inventario inventarioFromJson(String str) =>
    Inventario.fromJson(json.decode(str));

String inventarioToJson(Inventario data) => json.encode(data.toJson());

class Inventario {
  String? responsable;
  String? area;
  String? trabajador;
  String? nombreMaquina;
  String? usuarioMaquina;
  Software? software;
  List<Hardware>? hardware;

  Inventario(
      {this.responsable,
      this.area,
      this.trabajador,
      this.nombreMaquina,
      this.usuarioMaquina,
      this.hardware,
      this.software});

  factory Inventario.fromJson(Map<dynamic, dynamic> json) {
    var hard = json["hardware"];
    var area = json["area"];
    //print(hard);
    //print(area);
    return Inventario(
      responsable: json["responsable"],
      area: area,
      trabajador: json["trabajador"],
      nombreMaquina: json["nombreMaquina"],
      usuarioMaquina: json["usuarioMaquina"],
      hardware: json["hardware"] == null
          ? []
          : List<Hardware>.from(hard.map((x) => Hardware.fromJson(x))),
      software:
          json["software"] == null ? null : Software.fromJson(json["software"]),
    );
  }

  Inventario.fromJsons(Map<dynamic, dynamic> json) {
    responsable = json["responsable"];
    area = json["area"];
    trabajador = json["trabajador"];
    nombreMaquina = json["nombreMaquina"];
    usuarioMaquina = json["usuarioMaquina"];
    hardware = json["hardware"] == null
        ? []
        : List<Hardware>.from(
            json["hardware"]!.map((x) => Hardware.fromJsons(x)));
    software =
        json["software"] == null ? null : Software.fromJsons(json["software"]);
  }

  Map<String, dynamic> toJson() => {
        "responsable": responsable,
        "area": area,
        "trabajador": trabajador,
        "nombreMaquina": nombreMaquina,
        "usuarioMaquina": usuarioMaquina,
        "hardware": hardware == null
            ? []
            : List<dynamic>.from(hardware!.map((x) => x.toJson())),
        "software": software!.toJson()
      };
}
