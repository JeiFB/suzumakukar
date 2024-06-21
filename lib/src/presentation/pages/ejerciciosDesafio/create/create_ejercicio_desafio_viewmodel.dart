import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  File? _imageFile;

  File? get imageFile => _imageFile;

  CreateEjercicioDesafioViewModel(this._ejerciciosDesafioUseCases);

  createEjercicio(String idDesafio) async {
    // print('State: ${_state.toEjercicio().toJson()}');
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      if (_imageFile == null) {
        _response = await _ejerciciosDesafioUseCases.createEjercicioDesafio
            .launch(idDesafio, _state.toEjercicio());
      } else {
        _response = await _ejerciciosDesafioUseCases.createEjercicioImgUsecase
            .launch(idDesafio, _state.toEjercicio(), _imageFile!);
      }

      notifyListeners();
    }
    // else {
    //   print('campos vacios');
    // }
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

  resetState() {
    _state = CreateEjercicioDesafioState();
    notifyListeners();
  }
}
