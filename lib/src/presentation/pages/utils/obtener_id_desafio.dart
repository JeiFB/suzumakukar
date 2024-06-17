import 'package:flutter/material.dart';

class ObtenerIdDesafio extends ChangeNotifier {
  String? _idDesafio;

  get idDesafio => _idDesafio;

  setDesafioSeleccionado(String id) {
    _idDesafio = id;
    notifyListeners();
  }
}
