// import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

// class CreateEjercicioTestState {
//   String id;
//   ValidationItem ejercicio;
//   ValidationItem descripcion;
//   ValidationItem respuesta;
//   List<ValidationItem> opciones;
//   CreateEjercicioTestState(
//       {this.id = '',
//       this.ejercicio = const ValidationItem(),
//       this.descripcion = const ValidationItem(),
//       this.respuesta = const ValidationItem(),
//       this.opciones = const [
//         ValidationItem(value: ''),
//         ValidationItem(value: ''),
//         ValidationItem(value: ''),
//         ValidationItem(value: ''),
//       ]});

//   toEjercicio() => EjerciciosMultiple(
//       id: id,
//       ejercicio: ejercicio.value,
//       descripcion: descripcion.value,
//       respuesta: respuesta.value,
//       opciones: opciones.map((item) => item.value).toList());

//   bool isValid() {
//     if (descripcion.value.isEmpty ||
//         descripcion.value.isEmpty ||
//         ejercicio.value.isEmpty ||
//         opciones.any((option) => option.value.isEmpty)) {
//       return false;
//     }
//     return true;
//   }

//   CreateEjercicioTestState copyWith({
//     ValidationItem? ejercicio,
//     ValidationItem? descripcion,
//     ValidationItem? respuesta,
//     List<ValidationItem>? opciones,
//   }) =>
//       CreateEjercicioTestState(
//         ejercicio: ejercicio ?? this.ejercicio,
//         descripcion: descripcion ?? this.descripcion,
//         respuesta: respuesta ?? this.respuesta,
//         opciones: opciones ?? this.opciones,
//       );
// }
