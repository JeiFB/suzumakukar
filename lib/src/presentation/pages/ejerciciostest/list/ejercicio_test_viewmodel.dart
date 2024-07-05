// import 'package:flutter/material.dart';
// import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
// import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/ejercicios_test_usecases.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';

// class EjercicioTestViewModel extends ChangeNotifier {
//   final EjerciciosTestUseCases _ejerciciosDesafioUseCases;

//   EjercicioTestViewModel(this._ejerciciosDesafioUseCases);

//   Stream<Resource<List<EjerciciosMultiple>>> getEjercicios(String idTest) =>
//       _ejerciciosDesafioUseCases.getEjercicioTest.launch(idTest);

//   deleteEjercicio(String idTest, String idEjercicio) async {
//     await _ejerciciosDesafioUseCases.deleteEjercicioTest
//         .launch(idTest, idEjercicio);
//     notifyListeners();
//   }
// }
