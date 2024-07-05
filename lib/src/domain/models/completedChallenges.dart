// To parse this JSON data, do
//
//     final completedChallenges = completedChallengesFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

CompletedChallenges completedChallengesFromJson(String str) =>
    CompletedChallenges.fromJson(json.decode(str));

String completedChallengesToJson(CompletedChallenges data) =>
    json.encode(data.toJson());

class CompletedChallenges {
  String idDesafio;
  String desafioNumber;
  bool realizado;
  String nota;

  CompletedChallenges({
    this.idDesafio = '',
    this.desafioNumber = '',
    this.realizado = false,
    this.nota = '',
  });

  factory CompletedChallenges.fromJson(Map<String, dynamic> json) =>
      CompletedChallenges(
        idDesafio: json["idDesafio"] ?? '',
        desafioNumber: json["desafioNumber"] ?? '',
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
