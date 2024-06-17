import 'package:flutter/material.dart';

class ObtenerIdCurso extends ChangeNotifier {
  String? _idCurso;

  get idCurso => _idCurso;

  setcursoSeleccionado(String id) {
    _idCurso = id;
    notifyListeners();
  }
}
