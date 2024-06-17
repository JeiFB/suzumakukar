import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/lectura_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateLecturaViewModel extends ChangeNotifier {
  final LecturaUseCases _lecturaUseCases;

  Resource _response = Init();
  Resource get response => _response;

  CreateLecturaState _state = CreateLecturaState();
  CreateLecturaState get state => _state;
  CreateLecturaViewModel(this._lecturaUseCases);

  createLectura() async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response =
          await _lecturaUseCases.createLectura.launch(_state.toLectura());
      notifyListeners();
    }
  }

  changeTitulo(String value) {
    _state = _state.copyWith(titulo: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeTexto(String value) {
    _state = _state.copyWith(texto: ValidationItem(value: value, error: ''));
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = CreateLecturaState();
    notifyListeners();
  }
}
