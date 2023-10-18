// To parse this JSON data, do
//
//     final software = softwareFromJson(jsonString);

import 'dart:convert';

Software softwareFromJson(String str) => Software.fromJson(json.decode(str));

String softwareToJson(Software data) => json.encode(data.toJson());

class Software {
  String? sistema;
  String? antivirus;
  String? office;
  String? autocad;
  String? extras;

  Software({
    this.sistema,
    this.antivirus,
    this.office,
    this.autocad,
    this.extras,
  });

  factory Software.fromJson(Map<dynamic, dynamic> json) => Software(
        sistema: json["Sistema"],
        antivirus: json["Antivirus"],
        office: json["Office"],
        autocad: json["Autocad"],
        extras: json["extras"],
      );

  Software.fromJsons(Map<dynamic, dynamic> json) {
    sistema = json["Sistema"];
    antivirus = json["Antivirus"];
    office = json["Office"];
    autocad = json["Autocad"];
    extras = json["extras"];
  }

  Map<String, dynamic> toJson() => {
        "Sistema": sistema,
        "Antivirus": antivirus,
        "Office": office,
        "Autocad": autocad,
        "extras": extras,
      };
}
