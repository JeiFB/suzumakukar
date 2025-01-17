import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class EjercicioDesafioViewModel extends ChangeNotifier {
  final EjerciciosDesafioUseCases _ejerciciosDesafioUseCases;
  StreamSubscription<Resource<List<EjerciciosMultiple>>>? _subscription;
  Stream<Resource<List<EjerciciosMultiple>>>? _ejerciciosStream;
  Resource<List<EjerciciosMultiple>>? _currentEjercicios;

  EjercicioDesafioViewModel(this._ejerciciosDesafioUseCases);

  Stream<Resource<List<EjerciciosMultiple>>> getEjercicios(String idDesafio) {
    _ejerciciosStream =
        _ejerciciosDesafioUseCases.getEjercicioDesafio.launch(idDesafio);
    _subscription = _ejerciciosStream!.listen((data) {
      _currentEjercicios = data;
      notifyListeners();
    });
    return _ejerciciosStream!;
  }

  deleteEjercicio(String idDesafio, String idEjercicio) async {
    await _ejerciciosDesafioUseCases.deleteEjercicioDesafio
        .launch(idDesafio, idEjercicio);
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
