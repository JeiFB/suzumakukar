import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/update/ejercicio_update_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class EjercicioUpdateViewModel extends ChangeNotifier {
  EjercicioUpdateState _state = EjercicioUpdateState();
  EjercicioUpdateState get state => _state;

  final CursosUseCase _cursosUseCase;

  Resource _response = Init();
  Resource get response => _response;

  EjercicioUpdateViewModel(this._cursosUseCase);

  Future<void> loadData(Ejercicios ejercicios) async {
    // resetData();
    if (_state.id.isEmpty) {
      _state = _state.copyWith(id: ejercicios.id);
      _state = _state.copyWith(
          descripcion:
              ValidationItem(value: ejercicios.descripcion, error: ''));
      _state = _state.copyWith(ejercicio: ejercicios.ejercicio);
      _state = _state.copyWith(
          respuesta: ValidationItem(value: ejercicios.respuesta, error: ''));
      _state = _state.copyWith(
          ejecucion: List<ValidationItem>.from(ejercicios.ejecucion));
    }
  }

  updateEjercicio(String idCurso, String idNivel) async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response = await _cursosUseCase.updateEjercicio
          .launch(idCurso, idNivel, _state.toEjercicio());
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

  resetData() {
    _state = EjercicioUpdateState();
  }
}
