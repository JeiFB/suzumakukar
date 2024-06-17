// To parse this JSON data, do
//
//     final cursos = cursosFromJson(jsonString);

import 'dart:convert';

Cursos cursosFromJson(String str) => Cursos.fromJson(json.decode(str));

String cursosToJson(Cursos data) => json.encode(data.toJson());

class Cursos {
  String id;
  String cursoName;
  int niveles;

  Cursos({
    this.id = '',
    this.cursoName = '',
    this.niveles = 0,
  });

  factory Cursos.fromJson(Map<String, dynamic> json) => Cursos(
      id: json["id"] ?? '',
      cursoName: json["cursoName"] ?? '',
      niveles: json["niveles"] ?? 0);

  Map<String, dynamic> toJson() =>
      {"id": id, "cursoName": cursoName, "niveles": niveles};
}
