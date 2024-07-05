// To parse this JSON data, do
//
//     final desafios = desafiosFromJson(jsonString);

import 'dart:convert';

Desafios desafiosFromJson(String str) => Desafios.fromJson(json.decode(str));

String desafiosToJson(Desafios data) => json.encode(data.toJson());

class Desafios {
  String id;
  int desafio;
  String tema;
  // String img;

  Desafios({
    this.id = '',
    this.desafio = 0,
    this.tema = '',
    // required this.img,
  });

  factory Desafios.fromJson(Map<String, dynamic> json) => Desafios(
        id: json["id"] ?? '',
        desafio: json["desafio"] ?? 0,
        tema: json["tema"] ?? '',

        // img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "desafio": desafio,
        "tema": tema,
        // "img": img,
      };
}
