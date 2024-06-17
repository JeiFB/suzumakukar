import 'package:flutter/material.dart';

class DataResultados extends ChangeNotifier {
  int _totalPreguntas = 0;
  int _puntaje = 0;
  double _progreso = 0;

  get totalPreguntas => _totalPreguntas;
  get puntaje => _puntaje;
  get progreso => _progreso;

  void newTotalPreguntas(int newTotalPreguntas) {
    _totalPreguntas = newTotalPreguntas;
    notifyListeners();
  }

  void newPuntaje(int puntaje) {
    _puntaje += puntaje;
    notifyListeners();
  }

  void newProgreso(double progreso) {
    _progreso += progreso;
  }

  void reset() {
    _progreso = 0;
    _totalPreguntas = 0;
    _puntaje = 0;
  }
}
