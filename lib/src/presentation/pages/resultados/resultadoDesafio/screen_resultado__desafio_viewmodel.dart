import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/completed_challenge_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadoDesafio/screen_resultado__desafio_state.dart';

class ScreenResultadoDesafioViewModel extends ChangeNotifier {
  final CompletedChallengeUseCases _completeChallengeUseCases;
  final AuthUseCases _authUseCases;

  ScreenResultadoDesafioState _state = ScreenResultadoDesafioState();
  ScreenResultadoDesafioState get state => _state;

  final StreamController<Resource> _responseController =
      StreamController<Resource>.broadcast();

  Stream<Resource> get response => _responseController.stream;

  ScreenResultadoDesafioViewModel(
      this._completeChallengeUseCases, this._authUseCases);

  addResults() async {
    _responseController.add(Loading());
    final data = await _completeChallengeUseCases.addCompleteChallenge.launch(
        _state.toResults(), _authUseCases.getUser.userSession?.uid ?? '');
    _responseController.add(data);
  }

  idDesafio(String value) {
    _responseController.add(Init());
    _state = _state.copyWith(id: value);
    notifyListeners();
  }

  desafioNumber(int value) {
    _responseController.add(Init());
    _state = _state.copyWith(desafioNumber: value);
    notifyListeners();
  }

  notaDesafio(String value) {
    _responseController.add(Init());
    _state = _state.copyWith(nota: value);
    notifyListeners();
  }
}
