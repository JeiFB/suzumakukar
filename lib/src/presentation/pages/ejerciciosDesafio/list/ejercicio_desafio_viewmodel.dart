import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class EjercicioDesafioViewModel extends ChangeNotifier {
  final EjerciciosDesafioUseCases _ejerciciosDesafioUseCases;

  // final ObtenerIdDesafio _idDesafio;
  // final ObtenerIdEjercicio _idEjercicio;

  EjercicioDesafioViewModel(
      // this._idDesafio, this._idEjercicio,
      this._ejerciciosDesafioUseCases);

  Stream<Resource<List<EjerciciosMultiple>>> getEjercicios(String idDesafio) =>
      _ejerciciosDesafioUseCases.getEjercicioDesafio.launch(idDesafio);

  deleteEjercicio(String idDesafio, String idEjercicio) async {
    await _ejerciciosDesafioUseCases.deleteEjercicioDesafio
        .launch(idDesafio, idEjercicio);
    notifyListeners();
  }
}
