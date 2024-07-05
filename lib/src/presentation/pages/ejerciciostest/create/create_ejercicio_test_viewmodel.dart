// import 'package:flutter/material.dart';
// import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/ejercicios_test_usecases.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/create/create_ejercicio_state.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

// class CreateEjercicioTestViewModel extends ChangeNotifier {
//   final EjerciciosTestUseCases _ejerciciosTestseCases;

//   CreateEjercicioTestState _state = CreateEjercicioTestState();
//   CreateEjercicioTestState get state => _state;

//   Resource _response = Init();
//   Resource get response => _response;

//   CreateEjercicioTestViewModel(this._ejerciciosTestseCases);

//   createEjercicio(String idDesafio) async {
//     if (_state.isValid()) {
//       _response = Loading();
//       notifyListeners();
//       _response = await _ejerciciosTestseCases.createEjercicioTest
//           .launch(idDesafio, _state.toEjercicio());
//       notifyListeners();
//     } else {
//       notifyListeners();
//     }
//   }

//   changeEjercicio(String value) {
//     _state =
//         _state.copyWith(ejercicio: ValidationItem(value: value, error: ''));
//     notifyListeners();
//   }

//   changeDescripcion(String value) {
//     _state =
//         _state.copyWith(descripcion: ValidationItem(value: value, error: ''));
//     notifyListeners();
//   }

//   changeRespuesta(String value) {
//     _state =
//         _state.copyWith(respuesta: ValidationItem(value: value, error: ''));
//     notifyListeners();
//   }

//   changeOpcion(String value, {required int index}) {
//     List<ValidationItem> updatedOpciones = List.from(_state.opciones);
//     updatedOpciones[index] = ValidationItem(value: value, error: '');
//     _state = _state.copyWith(opciones: updatedOpciones);
//     notifyListeners();
//   }

//   resetResponse() {
//     _response = Init();
//     notifyListeners();
//   }

//   resetState() {
//     _state = CreateEjercicioTestState();
//     notifyListeners();
//   }
// }
