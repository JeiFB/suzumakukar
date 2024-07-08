// To parse this JSON data, do
//
//     final completedChallenges = completedChallengesFromJson(jsonString);

import 'dart:convert';

CompletedChallenges completedChallengesFromJson(String str) =>
    CompletedChallenges.fromJson(json.decode(str));

String completedChallengesToJson(CompletedChallenges data) =>
    json.encode(data.toJson());

class CompletedChallenges {
  String idDesafio;
  int desafioNumber;
  bool realizado;
  String nota;

  CompletedChallenges({
    this.idDesafio = '',
    this.desafioNumber = 0,
    this.realizado = false,
    this.nota = '',
  });

  factory CompletedChallenges.fromJson(Map<String, dynamic> json) =>
      CompletedChallenges(
        idDesafio: json["idDesafio"] ?? '',
        desafioNumber: json["desafioNumber"] ?? 0,
        realizado: json["realizado"] ?? false,
        nota: json["nota"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "idDesafio": idDesafio,
        "desafioNumber": desafioNumber,
        "realizado": realizado,
        "nota": nota,
      };
}
