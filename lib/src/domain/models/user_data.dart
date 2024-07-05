import 'dart:convert';

UserData userFromJson(String str) => UserData.fromJson(json.decode(str));

String userToJson(UserData data) => json.encode(data.toJson());

class UserData {
  String id;
  String name;
  String username;
  String img;
  bool rol;
  String password;

  UserData(
      {this.id = '',
      this.name = '',
      this.username = '',
      this.img = '',
      this.password = '',
      this.rol = false});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
      id: json["id"] ?? '',
      name: json["name"] ?? '',
      username: json["username"] ?? '',
      img: json['img'] ?? '',
      password: json["password"] ?? '',
      rol: json["rol"] ?? false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "img": img,
        "rol": rol,
        // "password": password,
      };
}
