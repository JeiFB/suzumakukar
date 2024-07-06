import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateEjercicioDesafioState {
  String id;
  int ejercicio;
  ValidationItem descripcion;
  ValidationItem respuesta;
  List<ValidationItem> opciones;
  String img;
  CreateEjercicioDesafioState(
      {this.id = '',
      this.ejercicio = 0,
      this.descripcion = const ValidationItem(),
      this.respuesta = const ValidationItem(),
      this.opciones = const [
        ValidationItem(value: ''),
        ValidationItem(value: ''),
        ValidationItem(value: ''),
        ValidationItem(value: ''),
      ],
      this.img = ''});

  toEjercicio() => EjerciciosMultiple(
      id: id,
      img: img,
      ejercicio: ejercicio,
      descripcion: descripcion.value,
      respuesta: respuesta.value,
      opciones: opciones.map((item) => item.value).toList());

  bool isValid() {
    if (descripcion.value.isEmpty ||
        descripcion.value.isEmpty ||
        ejercicio.isNegative ||
        opciones.any((option) => option.value.isEmpty)) {
      return false;
    }
    return true;
  }

  CreateEjercicioDesafioState copyWith(
          {int? ejercicio,
          ValidationItem? descripcion,
          ValidationItem? respuesta,
          List<ValidationItem>? opciones,
          String? img}) =>
      CreateEjercicioDesafioState(
          ejercicio: ejercicio ?? this.ejercicio,
          descripcion: descripcion ?? this.descripcion,
          respuesta: respuesta ?? this.respuesta,
          opciones: opciones ?? this.opciones,
          img: img ?? this.img);
}
