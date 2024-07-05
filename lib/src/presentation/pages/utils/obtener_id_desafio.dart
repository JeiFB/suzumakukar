import 'package:flutter/material.dart';

class ObtenerIdDesafio extends ChangeNotifier {
  String? _idDesafio;
  int? _desafioNumber;

  get idDesafio => _idDesafio;
  get desafioNumber => _desafioNumber;

  setDesafioSeleccionado(String id) {
    _idDesafio = id;
    notifyListeners();
  }

  setDesafioNumber(int desafio) {
    _desafioNumber = desafio;
    notifyListeners();
  }
}
