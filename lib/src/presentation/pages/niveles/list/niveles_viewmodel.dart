import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class NivelesViewModel extends ChangeNotifier {
  final CursosUseCase _cursosUseCase;

  NivelesViewModel(this._cursosUseCase);

  Stream<Resource<List<Niveles>>> getNiveles(String id) =>
      _cursosUseCase.getNiveles.launch(id);

  deleteNivel(String idCurso, String idNivel) async {
    await _cursosUseCase.deleteNiveles.launch(idCurso, idNivel);
    notifyListeners();
  }
}
