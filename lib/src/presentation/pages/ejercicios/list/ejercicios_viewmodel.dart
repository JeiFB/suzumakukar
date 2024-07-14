import 'dart:async';
import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class EjerciciosViewModel extends ChangeNotifier {
  final CursosUseCase _cursosUseCase;
  StreamSubscription<Resource<List<Ejercicios>>>? _subscription;
  Stream<Resource<List<Ejercicios>>>? _ejerciciosStream;
  Resource<List<Ejercicios>>? _currentEjercicios;

  EjerciciosViewModel(this._cursosUseCase);

  Stream<Resource<List<Ejercicios>>> getEjercicios(
      String idCurso, String idEjercicios) {
    _ejerciciosStream =
        _cursosUseCase.getEjercicios.launch(idCurso, idEjercicios);
    _subscription = _ejerciciosStream!.listen((data) {
      _currentEjercicios = data;
      notifyListeners();
    });
    return _ejerciciosStream!;
  }

  deleteEjercicio(String idCurso, String idNivel, String idEjercicio) async {
    await _cursosUseCase.deleteEjercicios.launch(idCurso, idNivel, idEjercicio);
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
