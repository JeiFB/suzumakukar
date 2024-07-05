import 'package:flutter/material.dart';

class ObtenerIdDesafio extends ChangeNotifier {
  String? _idDesafio;
  String? _desafioNumber;

  get idDesafio => _idDesafio;
  get desafioNumber => _desafioNumber;

  setDesafioSeleccionado(String id) {
    _idDesafio = id;
    notifyListeners();
  }

  setDesafioNumber(String desafio) {
    _desafioNumber = desafio;
    notifyListeners();
  }
}
