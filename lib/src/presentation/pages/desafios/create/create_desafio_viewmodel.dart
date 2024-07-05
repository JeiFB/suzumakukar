import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/desafios_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/create/create_desafio_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateDesafioViewModel extends ChangeNotifier {
  final DesafiosUseCases _desafiosUseCases;

  CreateDesafioState _state = CreateDesafioState();
  CreateDesafioState get state => _state;

  Resource _response = Init();
  Resource get response => _response;

  CreateDesafioViewModel(this._desafiosUseCases);

  createDesafio() async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response =
          await _desafiosUseCases.createDesafio.launch(_state.toDesafio());
      notifyListeners();
    }
  }

  changeDesafio(int value) {
    _state = _state.copyWith(desafioNumber: value);
    notifyListeners();
  }

  changeTema(String value) {
    _state = _state.copyWith(tema: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = CreateDesafioState();
    notifyListeners();
  }
}
