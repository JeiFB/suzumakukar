import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class UpdateLecturaState {
  String id;
  ValidationItem titulo;
  ValidationItem texto;

  UpdateLecturaState(
      {this.id = '',
      this.titulo = const ValidationItem(),
      this.texto = const ValidationItem()});

  toLectura() => Lectura(id: id, titulo: titulo.value, texto: texto.value);

  bool isValid() {
    if (titulo.value.isEmpty || texto.value.isEmpty || id.isEmpty) {
      return false;
    }
    return true;
  }

  UpdateLecturaState copyWith(
          {String? id, ValidationItem? titulo, ValidationItem? texto}) =>
      UpdateLecturaState(
          id: id ?? this.id,
          titulo: titulo ?? this.titulo,
          texto: texto ?? this.texto);
}
