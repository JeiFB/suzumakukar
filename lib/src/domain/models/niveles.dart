// To parse this JSON data, do
//
//     final niveles = nivelesFromJson(jsonString);

import 'dart:convert';

Niveles nivelesFromJson(String str) => Niveles.fromJson(json.decode(str));

String nivelesToJson(Niveles data) => json.encode(data.toJson());

class Niveles {
  String id;
  int nivel;
  String tema;

  Niveles({
    this.id = '',
    this.nivel = 0,
    this.tema = '',
  });

  factory Niveles.fromJson(Map<String, dynamic> json) => Niveles(
        id: json["id"] ?? '',
        nivel: json["Nivel"] ?? 0,
        tema: json["tema"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Nivel": nivel,
        "tema": tema,
      };
}
