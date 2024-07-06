import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class EjercicioUpdateDesafioState {
  String id;
  String img;
  int ejercicio;
  ValidationItem descripcion;
  ValidationItem respuesta;
  List<ValidationItem> opciones;

  EjercicioUpdateDesafioState(
      {this.id = '',
      this.img = '',
      this.ejercicio = 0,
      this.descripcion = const ValidationItem(),
      this.respuesta = const ValidationItem(),
      this.opciones = const [
        ValidationItem(value: ''),
        ValidationItem(value: ''),
        ValidationItem(value: ''),
        ValidationItem(value: ''),
      ]});

  toEjercicio() => EjerciciosMultiple(
      id: id,
      img: img,
      ejercicio: ejercicio,
      descripcion: descripcion.value,
      respuesta: respuesta.value,
      opciones: opciones.map((item) => item.value).toList());

  bool isValid() {
    if (descripcion.value.isEmpty ||
        respuesta.value.isEmpty ||
        ejercicio.isNegative ||
        opciones.any((option) => option.value.isEmpty) ||
        id.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  EjercicioUpdateDesafioState copyWith({
    String? id,
    String? img,
    int? ejercicio,
    ValidationItem? descripcion,
    ValidationItem? respuesta,
    List<ValidationItem>? opciones,
  }) =>
      EjercicioUpdateDesafioState(
        id: id ?? this.id,
        img: img ?? this.img,
        ejercicio: ejercicio ?? this.ejercicio,
        descripcion: descripcion ?? this.descripcion,
        respuesta: respuesta ?? this.respuesta,
        opciones: opciones ?? this.opciones,
      );
}
