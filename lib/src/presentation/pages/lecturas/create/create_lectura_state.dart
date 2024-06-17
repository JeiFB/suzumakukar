import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateLecturaState {
  String id;
  ValidationItem titulo;
  ValidationItem texto;

  CreateLecturaState(
      {this.id = '',
      this.titulo = const ValidationItem(),
      this.texto = const ValidationItem()});

  toLectura() => Lectura(id: id, titulo: titulo.value, texto: texto.value);

  bool isValid() {
    if (titulo.value.isEmpty || texto.value.isEmpty) {
      return false;
    }
    return true;
  }

  CreateLecturaState copyWith(
          {ValidationItem? titulo, ValidationItem? texto}) =>
      CreateLecturaState(
          titulo: titulo ?? this.titulo, texto: texto ?? this.texto);
}
