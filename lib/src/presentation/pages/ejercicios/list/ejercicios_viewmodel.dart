import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class EjerciciosViewModel extends ChangeNotifier {
  final CursosUseCase _cursosUseCase;

  EjerciciosViewModel(this._cursosUseCase);

  Stream<Resource<List<Ejercicios>>> getEjercicios(
          String idCurso, String idEjercicios) =>
      _cursosUseCase.getEjercicios.launch(idCurso, idEjercicios);

  deleteEjercicio(String idCurso, String idNivel, String idEjercicio) async {
    await _cursosUseCase.deleteEjercicios.launch(idCurso, idNivel, idEjercicio);
    notifyListeners();
  }
}
