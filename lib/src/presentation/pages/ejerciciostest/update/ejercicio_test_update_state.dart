// import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

// class EjercicioTestUpdateState {
//   String id;
//   ValidationItem ejercicio;
//   ValidationItem descripcion;
//   ValidationItem respuesta;
//   List<ValidationItem> opciones;

//   EjercicioTestUpdateState(
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
//         respuesta.value.isEmpty ||
//         ejercicio.value.isEmpty ||
//         opciones.any((option) => option.value.isEmpty) ||
//         id.isEmpty) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   EjercicioTestUpdateState copyWith({
//     String? id,
//     ValidationItem? ejercicio,
//     ValidationItem? descripcion,
//     ValidationItem? respuesta,
//     List<ValidationItem>? opciones,
//   }) =>
//       EjercicioTestUpdateState(
//         id: id ?? this.id,
//         ejercicio: ejercicio ?? this.ejercicio,
//         descripcion: descripcion ?? this.descripcion,
//         respuesta: respuesta ?? this.respuesta,
//         opciones: opciones ?? this.opciones,
//       );
// }
