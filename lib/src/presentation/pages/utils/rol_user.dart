import 'package:flutter/material.dart';

class RolUser extends ChangeNotifier {
  bool rol;
  RolUser({this.rol = false});
  get rolUser => rol;

  setIdUser(bool rol) {
    this.rol = rol;
    notifyListeners();
  }
}
