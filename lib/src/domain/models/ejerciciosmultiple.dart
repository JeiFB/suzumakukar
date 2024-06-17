// To parse this JSON data, do
//
//     final ejerciciosdesafio = ejerciciosdesafioFromJson(jsonString);

import 'dart:convert';

EjerciciosMultiple ejerciciosdesafioFromJson(String str) =>
    EjerciciosMultiple.fromJson(json.decode(str));

String ejerciciosdesafioToJson(EjerciciosMultiple data) =>
    json.encode(data.toJson());

class EjerciciosMultiple {
  String id;
  String ejercicio;
  String descripcion;
  List<dynamic> opciones;
  String respuesta;
  // String img;

  EjerciciosMultiple({
    this.id = '',
    this.ejercicio = '',
    this.descripcion = '',
    this.respuesta = '',
    this.opciones = const [],
    // required this.img,
  });

  factory EjerciciosMultiple.fromJson(Map<String, dynamic> json) =>
      EjerciciosMultiple(
        id: json["id"] ?? '',
        ejercicio: json["ejercicio"] ?? '',
        descripcion: json["descripcion"] ?? '',
        respuesta: json["respuesta"] ?? '',
        opciones: List<dynamic>.from(
            (json["opciones"] ?? []).map((x) => x.toString())),
        // img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ejercicio": ejercicio,
        "descripcion": descripcion,
        "opciones": opciones,
        "respuesta": respuesta,
        // "img": img,
      };
}
