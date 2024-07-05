import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/update/ejercicio_update_desafio_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class EjercicioUpdateDesafioViewModel extends ChangeNotifier {
  final EjerciciosDesafioUseCases _ejerciciosDesafioUseCases;

  EjercicioUpdateDesafioState _state = EjercicioUpdateDesafioState();
  EjercicioUpdateDesafioState get state => _state;

  Resource _response = Init();
  Resource get response => _response;

  File? _imageFile;

  File? get imageFile => _imageFile;

  EjercicioUpdateDesafioViewModel(this._ejerciciosDesafioUseCases);

  Future<void> loadData(EjerciciosMultiple ejercicios) async {
    if (_state.id.isEmpty) {
      _state = _state.copyWith(id: ejercicios.id);
      _state = _state.copyWith(
          descripcion:
              ValidationItem(value: ejercicios.descripcion, error: ''));
      _state = _state.copyWith(
          ejercicio: ValidationItem(value: ejercicios.ejercicio, error: ''));
      _state = _state.copyWith(
          respuesta: ValidationItem(value: ejercicios.respuesta, error: ''));
      _state = _state.copyWith(opciones: [
        ValidationItem(value: ejercicios.opciones[0]),
        ValidationItem(value: ejercicios.opciones[1]),
        ValidationItem(value: ejercicios.opciones[2]),
        ValidationItem(value: ejercicios.opciones[3])
      ]);
    }
  }

  updateEjercicio(String idDesafio) async {
    // print('State: ${_state.toEjercicio().toJson()}');
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      if (_imageFile == null) {
        _response = await _ejerciciosDesafioUseCases
            .updateEjercicioDesafioUseCase
            .launch(idDesafio, _state.toEjercicio());
        notifyListeners();
      } else {
        _response = await _ejerciciosDesafioUseCases
            .ejerciciosDesafiosImageUsecase
            .launch(idDesafio, _state.toEjercicio(), _imageFile!);
        notifyListeners();
      }
    } else {
      notifyListeners();
    }
  }

  Future<void> pickerImage() async {
    final ImagePicker picker = ImagePicker();
    // final LostDataResponse response = await picker.retrieveLostData();
    // if (response.isEmpty) {
    //   return;
    // }
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
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

  resetData() {
    _state = EjercicioUpdateDesafioState();
  }
}
