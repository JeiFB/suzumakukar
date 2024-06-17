import 'package:flutter/material.dart';

class ObtenerIdLectura extends ChangeNotifier {
  String? _idLectura;

  get idLectura => _idLectura;

  setcursoSeleccionado(String id) {
    _idLectura = id;
    notifyListeners();
  }
}
