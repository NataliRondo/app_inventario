// To parse this JSON data, do
//
//     final hardware = hardwareFromJson(jsonString);

import 'dart:convert';

List<Hardware> hardwareFromJson(String str) =>
    List<Hardware>.from(json.decode(str).map((x) => Hardware.fromJson(x)));

String hardwareToJson(List<Hardware> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hardware {
  String? hardware;
  Contenido? contenido;
  String? observacion;

  Hardware({
    this.hardware,
    this.contenido,
    this.observacion,
  });

  factory Hardware.fromJson(Map<dynamic, dynamic> json) => Hardware(
        hardware: json["Hardware"],
        contenido: json["contenido"] == null
            ? null
            : Contenido.fromJson(json["contenido"]),
        observacion: json["observacion"],
      );

  Hardware.fromJsons(Map<String, dynamic> json) {
    hardware = json["Hardware"];
    contenido = json["contenido"] == null
        ? null
        : Contenido.fromJsons(json["contenido"]);
    observacion = json["observacion"];
  }

  Map<String, dynamic> toJson() => {
        "Hardware": hardware,
        "contenido": contenido?.toJson(),
        "observacion": observacion,
      };
}

class Contenido {
  String? patrimonial;
  String? procesador;
  String? campos;
  String? marca;
  String? memoria;

  Contenido({
    this.patrimonial,
    this.procesador,
    this.campos,
    this.marca,
    this.memoria,
  });

  factory Contenido.fromJson(Map<dynamic, dynamic> json) => Contenido(
        patrimonial: json["patrimonial"],
        procesador: json["procesador"],
        campos: json["campos"],
        marca: json["marca"],
        memoria: json["memoria"],
      );

  Contenido.fromJsons(Map<String, dynamic> json) {
    patrimonial = json["patrimonial"];
    procesador = json["procesador"];
    campos = json["campos"];
    marca = json["marca"];
    memoria = json["memoria"];
  }

  Map<String, dynamic> toJson() => {
        "patrimonial": patrimonial,
        "procesador": procesador,
        "campos": campos,
        "marca": marca,
        "memoria": memoria,
      };
}
