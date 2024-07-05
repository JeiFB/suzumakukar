import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/completed_challenge_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/desafios_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class DesafiosViewModel extends ChangeNotifier {
  final DesafiosUseCases _desafiosUseCases;
  final CompletedChallengeUseCases _completedChallengeUseCases;
  final AuthUseCases _authUseCases;
  DesafiosViewModel(this._desafiosUseCases, this._completedChallengeUseCases,
      this._authUseCases);

  Stream<Resource<List<Desafios>>> getDesafios() =>
      _desafiosUseCases.getDesafios.launch();

  Stream<List<CompletedChallenges>> completedChallenges() =>
      _completedChallengeUseCases.getCompleteChallenge
          .launch(_authUseCases.getUser.userSession?.uid ?? '');

  deleteDesafio(String id) async {
    await _desafiosUseCases.deleteDesafios.launch(id);
    notifyListeners();
  }
}
