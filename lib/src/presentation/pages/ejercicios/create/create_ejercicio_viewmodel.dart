import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/create/create_ejercicio_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateEjercicioViewModel extends ChangeNotifier {
  final CursosUseCase _cursosUseCase;

  CreateEjercicioState _state = CreateEjercicioState();
  CreateEjercicioState get state => _state;

  Resource _response = Init();
  Resource get response => _response;

  CreateEjercicioViewModel(this._cursosUseCase);

  createEjercicio(String idCurso, String idNivel) async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response = await _cursosUseCase.createEjercicios
          .launch(idCurso, idNivel, _state.toEjercicios());
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  changeEjercicio(int value) {
    _state = _state.copyWith(ejercicio: value);
    notifyListeners();
  }

  changeDescripcion(String value) {
    _state =
        _state.copyWith(descripcion: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeRespuesta(String value) {
    _state =
        _state.copyWith(respuesta: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeEjecucion(List<String> value) {
    final List<ValidationItem> nuevosCampos =
        value.map((campo) => ValidationItem(value: campo)).toList();
    _state = _state.copyWith(ejecucion: [..._state.ejecucion, ...nuevosCampos]);
    notifyListeners();
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = CreateEjercicioState();
    notifyListeners();
  }
}
