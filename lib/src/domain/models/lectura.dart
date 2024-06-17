// To parse this JSON data, do
//
//     final lectura = lecturaFromJson(jsonString);

import 'dart:convert';

Lectura lecturaFromJson(String str) => Lectura.fromJson(json.decode(str));

String lecturaToJson(Lectura data) => json.encode(data.toJson());

class Lectura {
  String id;
  String titulo;
  String texto;

  Lectura({
    this.id = '',
    this.titulo = '',
    this.texto = '',
  });

  factory Lectura.fromJson(Map<String, dynamic> json) => Lectura(
        id: json["id"] ?? '',
        titulo: json["titulo"] ?? '',
        texto: json["texto"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "texto": texto,
      };
}
