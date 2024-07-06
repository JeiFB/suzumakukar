import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateEjercicioState {
  String id;
  int ejercicio;
  ValidationItem descripcion;
  ValidationItem respuesta;
  List<ValidationItem> ejecucion;

  CreateEjercicioState({
    this.id = '',
    this.ejercicio = 0,
    this.descripcion = const ValidationItem(),
    this.respuesta = const ValidationItem(),
    this.ejecucion = const [],
  });

  toEjercicios() => Ejercicios(
      id: id,
      ejercicio: ejercicio,
      descripcion: descripcion.value,
      respuesta: respuesta.value,
      ejecucion: ejecucion.map((item) => item.value).toList());

  bool isValid() {
    if (descripcion.value.isEmpty ||
        respuesta.value.isEmpty ||
        ejercicio.isNegative ||
        ejecucion.any((option) => option.value.isEmpty)) {
      return false;
    } else {
      return true;
    }
  }

  CreateEjercicioState copyWith(
          {int? ejercicio,
          ValidationItem? descripcion,
          ValidationItem? respuesta,
          List<ValidationItem>? ejecucion}) =>
      CreateEjercicioState(
          ejercicio: ejercicio ?? this.ejercicio,
          descripcion: descripcion ?? this.descripcion,
          respuesta: respuesta ?? this.respuesta,
          ejecucion: ejecucion ?? this.ejecucion);
}
