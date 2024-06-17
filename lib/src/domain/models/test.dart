// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
  String id;
  String tema;
  String nameTest;

  Test({
    this.id = '',
    this.tema = '',
    this.nameTest = '',
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"] ?? '',
        tema: json["tema"] ?? '',
        nameTest: json["nameTest"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tema": tema,
        "nameTest": nameTest,
      };
}
