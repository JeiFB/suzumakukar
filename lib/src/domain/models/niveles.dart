// To parse this JSON data, do
//
//     final niveles = nivelesFromJson(jsonString);

import 'dart:convert';

Niveles nivelesFromJson(String str) => Niveles.fromJson(json.decode(str));

String nivelesToJson(Niveles data) => json.encode(data.toJson());

class Niveles {
  String id;
  String nivel;
  String tema;

  Niveles({
    this.id = '',
    this.nivel = '',
    this.tema = '',
  });

  factory Niveles.fromJson(Map<String, dynamic> json) => Niveles(
        id: json["id"] ?? '',
        nivel: json["Nivel"] ?? '',
        tema: json["tema"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Nivel": nivel,
        "tema": tema,
      };
}
