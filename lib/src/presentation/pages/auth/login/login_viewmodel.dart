import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/auth/login/login_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class LoginViewModel extends ChangeNotifier {
  //STATES
  LoginState _state = LoginState();
  // String? errorMessage;

  final StreamController<Resource> _responseController =
      StreamController<Resource>.broadcast();
  Stream<Resource> get response => _responseController.stream;
  //GETTERS
  LoginState get state => _state;

  //USE CASE
  final AuthUseCases _authUseCases;

  LoginViewModel(this._authUseCases);

  // SETTERS
  changeUserName(String value) {
    _responseController.add(Init());
    _state = _state.copyWith(userName: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changePassword(String value) {
    _state = _state.copyWith(password: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  login() async {
    if (_state.isValid()) {
      _responseController.add(Loading()); //Esperando la respuesta
      final data = await _authUseCases.login.launch(
          username: '${_state.userName.value}@suzumakukar.com',
          password: _state.password.value);
      _responseController.add(data);
    }
  }
}
