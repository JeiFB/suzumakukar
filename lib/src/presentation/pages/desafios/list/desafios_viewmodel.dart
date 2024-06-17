import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/desafios_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class DesafiosViewModel extends ChangeNotifier {
  final DesafiosUseCases _desafiosUseCases;

  DesafiosViewModel(this._desafiosUseCases);

  Stream<Resource<List<Desafios>>> getDesafios() =>
      _desafiosUseCases.getDesafios.launch();

  deleteDesafio(String id) async {
    await _desafiosUseCases.deleteDesafios.launch(id);
    notifyListeners();
  }
}
