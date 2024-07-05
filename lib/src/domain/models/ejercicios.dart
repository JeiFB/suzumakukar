// To parse this JSON data, do
//
//     final niveles = nivelesFromJson(jsonString);

import 'dart:convert';

Ejercicios ejerciciosFromJson(String str) =>
    Ejercicios.fromJson(json.decode(str));

String ejerciciosToJson(Ejercicios data) => json.encode(data.toJson());

class Ejercicios {
  String id;
  String ejercicio;
  String descripcion;
  String respuesta;
  String img;
  List<dynamic> ejecucion;
  // String razonamiento;

  Ejercicios({
    this.id = '',
    this.ejercicio = "",
    this.descripcion = '',
    this.respuesta = '',
    this.ejecucion = const [],
    this.img = "",
    // this.ejecucion = "",
    // this.razonamiento = "",
  });

  factory Ejercicios.fromJson(Map<String, dynamic> json) => Ejercicios(
        id: json["id"] ?? '',
        ejercicio: json["ejercicio"],
        descripcion: json["descripcion"] ?? '',
        respuesta: json["respuesta"] ?? '',
        ejecucion: List<dynamic>.from(
            (json["ejecucion"] ?? []).map((x) => x.toString())),
        img: json["img"],
        // ejecucion: json["ejecucion"],
        // razonamiento: json["razonamiento"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ejercicio": ejercicio,
        "descripcion": descripcion,
        "respuesta": respuesta,
        "ejecucion": ejecucion,
        "img": img,
        // "ejecucion": ejecucion,
        // "razonamiento": razonamiento,
      };
}
