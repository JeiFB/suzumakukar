import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/lectura_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/update/update_lectura_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class UpdateLecturaViewModel extends ChangeNotifier {
  final LecturaUseCases _lecturaUseCases;

  Resource _response = Init();
  Resource get response => _response;

  UpdateLecturaState _state = UpdateLecturaState();
  UpdateLecturaState get state => _state;
  UpdateLecturaViewModel(this._lecturaUseCases);

  Future<void> loadData(Lectura lectura) async {
    if (_state.id.isEmpty) {
      _state = _state.copyWith(id: lectura.id);
      _state = _state.copyWith(titulo: ValidationItem(value: lectura.titulo));
      _state = _state.copyWith(texto: ValidationItem(value: lectura.texto));
    }
  }

  updateLectura() async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response =
          await _lecturaUseCases.updateLectura.launch(_state.toLectura());
      notifyListeners();
    }
  }

  changeTitulo(String value) {
    _state = _state.copyWith(titulo: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeTexto(String value) {
    _state = _state.copyWith(texto: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = UpdateLecturaState();
    notifyListeners();
  }
}
