import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateNivelesState {
  String id;
  ValidationItem nivel;
  ValidationItem tema;

  CreateNivelesState(
      {this.id = '',
      this.nivel = const ValidationItem(),
      this.tema = const ValidationItem()});

  toNivel() => Niveles(id: id, nivel: nivel.value, tema: tema.value);

  bool isValid() {
    if (nivel.value.isEmpty || tema.value.isEmpty) {
      return false;
    }
    return true;
  }

  CreateNivelesState copyWith({ValidationItem? nivel, ValidationItem? tema}) =>
      CreateNivelesState(nivel: nivel ?? this.nivel, tema: tema ?? this.tema);
}
