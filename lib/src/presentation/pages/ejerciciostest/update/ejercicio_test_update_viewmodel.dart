// import 'package:flutter/material.dart';
// import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
// import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/ejercicios_test_usecases.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/update/ejercicio_test_update_state.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

// class EjercicioTestUpdateViewModel extends ChangeNotifier {
//   final EjerciciosTestUseCases _ejerciciosTestUseCases;

//   EjercicioTestUpdateState _state = EjercicioTestUpdateState();
//   EjercicioTestUpdateState get state => _state;

//   Resource _response = Init();
//   Resource get response => _response;

//   EjercicioTestUpdateViewModel(this._ejerciciosTestUseCases);

//   Future<void> loadData(EjerciciosMultiple ejercicios) async {
//     if (_state.id.isEmpty) {
//       _state = _state.copyWith(id: ejercicios.id);
//       _state = _state.copyWith(
//           descripcion:
//               ValidationItem(value: ejercicios.descripcion, error: ''));
//       _state = _state.copyWith(
//           ejercicio: ValidationItem(value: ejercicios.ejercicio, error: ''));
//       _state = _state.copyWith(
//           respuesta: ValidationItem(value: ejercicios.respuesta, error: ''));
//       _state = _state.copyWith(opciones: [
//         ValidationItem(value: ejercicios.opciones[0]),
//         ValidationItem(value: ejercicios.opciones[1]),
//         ValidationItem(value: ejercicios.opciones[2]),
//         ValidationItem(value: ejercicios.opciones[3])
//       ]);
//     }
//   }

//   updateEjercicio(String idTest) async {
//     // print('State: ${_state.toEjercicio().toJson()}');
//     if (_state.isValid()) {
//       _response = Loading();
//       notifyListeners();
//       _response = await _ejerciciosTestUseCases.updateEjercicioTestUseCase
//           .launch(idTest, _state.toEjercicio());
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

//   resetData() {
//     _state = EjercicioTestUpdateState();
//   }
// }
