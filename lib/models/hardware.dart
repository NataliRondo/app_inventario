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
  String? modelo;
  String? serie;
  String? marca;
  String? memoria;
  String? disco;
  String? tarjeta;

  Contenido(
      {this.patrimonial,
      this.procesador,
      this.campos,
      this.modelo,
      this.serie,
      this.disco,
      this.marca,
      this.memoria,
      this.tarjeta});

  factory Contenido.fromJson(Map<dynamic, dynamic> json) => Contenido(
      patrimonial: json["patrimonial"],
      procesador: json["procesador"],
      campos: json["campos"],
      modelo: json["modelo"],
      serie: json["serie"],
      disco: json["disco"],
      marca: json["marca"],
      memoria: json["memoria"],
      tarjeta: json["tarjeta"]);

  Contenido.fromJsons(Map<String, dynamic> json) {
    patrimonial = json["patrimonial"];
    procesador = json["procesador"];
    campos = json["campos"];
    modelo = json["modelo"];
    serie = json["serie"];
    disco = json["disco"];
    marca = json["marca"];
    memoria = json["memoria"];
    tarjeta = json["tarjeta"];
  }

  Map<String, dynamic> toJson() => {
        "patrimonial": patrimonial,
        "procesador": procesador,
        "campos": campos,
        "modelo": modelo,
        "serie": serie,
        "disco": disco,
        "marca": marca,
        "memoria": memoria,
        "tarjeta": tarjeta
      };
}
