import 'package:flutter/material.dart';

class ObtenerIdNivel extends ChangeNotifier {
  String? _idNivel;

  get idNivel => _idNivel;
  nivelSeleccionado(String id) {
    _idNivel = id;
    notifyListeners();
  }
}
