import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/lectura_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class LecturaListViewModel extends ChangeNotifier {
  final LecturaUseCases _lecturaUseCases;
  LecturaListViewModel(this._lecturaUseCases);

  Stream<Resource<List<Lectura>>> getLectura() =>
      _lecturaUseCases.getLectura.launch();

  deleteLectura(String id) async {
    await _lecturaUseCases.deleteLectura.launch(id);
    notifyListeners();
  }
}
