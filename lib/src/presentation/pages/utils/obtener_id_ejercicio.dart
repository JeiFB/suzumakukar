import 'package:flutter/material.dart';

class ObtenerIdEjercicio extends ChangeNotifier {
  String? _idEjercicio;

  get idEjercicio => _idEjercicio;

  setEjercicioSeleccionado(String id) {
    _idEjercicio = id;
    notifyListeners();
  }
}
