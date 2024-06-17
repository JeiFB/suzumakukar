import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/create/create_ejercicio_desafio_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateEjercicioDesafioViewModel extends ChangeNotifier {
  final EjerciciosDesafioUseCases _ejerciciosDesafioUseCases;

  CreateEjercicioDesafioState _state = CreateEjercicioDesafioState();
  CreateEjercicioDesafioState get state => _state;

  Resource _response = Init();
  Resource get response => _response;

  CreateEjercicioDesafioViewModel(this._ejerciciosDesafioUseCases);

  createEjercicio(String idDesafio) async {
    print('State: ${_state.toEjercicio().toJson()}');
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response = await _ejerciciosDesafioUseCases.createEjercicioDesafio
          .launch(idDesafio, _state.toEjercicio());
      notifyListeners();
    } else {
      print('campos vacios');
    }
  }

  changeEjercicio(String value) {
    _state =
        _state.copyWith(ejercicio: ValidationItem(value: value, error: ''));
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

  changeOpcion(String value, {required int index}) {
    List<ValidationItem> updatedOpciones = List.from(_state.opciones);
    updatedOpciones[index] = ValidationItem(value: value, error: '');
    _state = _state.copyWith(opciones: updatedOpciones);
    notifyListeners();
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = CreateEjercicioDesafioState();
    notifyListeners();
  }
}
