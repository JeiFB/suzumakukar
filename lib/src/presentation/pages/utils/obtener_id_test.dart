import 'package:flutter/material.dart';

class ObtenerIdTest extends ChangeNotifier {
  String? _idTest;

  get idTest => _idTest;
  setTestSeleccionado(String id) {
    _idTest = id;
    notifyListeners();
  }
}
