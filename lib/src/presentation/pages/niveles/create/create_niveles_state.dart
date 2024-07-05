import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateNivelesState {
  String id;
  int nivel;
  ValidationItem tema;

  CreateNivelesState(
      {this.id = '', this.nivel = 0, this.tema = const ValidationItem()});

  toNivel() => Niveles(id: id, nivel: nivel, tema: tema.value);

  bool isValid() {
    if (nivel.isNegative || tema.value.isEmpty) {
      return false;
    }
    return true;
  }

  CreateNivelesState copyWith({int? nivel, ValidationItem? tema}) =>
      CreateNivelesState(nivel: nivel ?? this.nivel, tema: tema ?? this.tema);
}
