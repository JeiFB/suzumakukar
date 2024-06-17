import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';
import 'package:suzumakukar/src/presentation/pages/auth/register/register_state.dart';

class RegisterViewmodel extends ChangeNotifier {
  // USE CASE
  final AuthUseCases _authUseCases;

  //ESTADO
  RegisterState _state = RegisterState();
  RegisterState get state => _state;

  final StreamController<Resource> _responseController =
      StreamController<Resource>.broadcast();
  Stream<Resource> get response => _responseController.stream;

  RegisterViewmodel(this._authUseCases);

//SETTER
  changeName(String value) async {
    _responseController.add(Init());
    if (value.length >= 3) {
      _state = _state.copyWith(name: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          name: const ValidationItem(error: 'Nombre de usuario no valido'));
    }
    notifyListeners();
  }

  changeUserName(String value) {
    _responseController.add(Init());
    if (value.isNotEmpty) {
      _state =
          _state.copyWith(username: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          username: const ValidationItem(error: 'Nombre de usuario no valido'));
    }
    notifyListeners();
  }

  changePassword(String value) {
    _responseController.add(Init());
    if (value.length >= 6) {
      _state =
          _state.copyWith(password: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          password: const ValidationItem(error: 'Contraseña no valida'));
    }
    notifyListeners();
  }

  changeConfirmPassword(String value) {
    _responseController.add(Init());
    if (value.isNotEmpty) {
      _state = _state.copyWith(
          confirmpassword: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          confirmpassword:
              const ValidationItem(error: 'Contraseña no coincide'));
    }
    notifyListeners();
  }

  registrarse() async {
    if (_state.isValid()) {
      _responseController.add(Loading());
      final data = await _authUseCases.register.launch(_state.toUser());
      _responseController.add(data);
    }
  }

  // resetState() {
  //   _state = RegisterState();
  //   _responseController = StreamController<Resource>.broadcast();
  //   // notifyListeners();
  // }
}
