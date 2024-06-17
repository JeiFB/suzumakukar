import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateDesafioState {
  String id;
  ValidationItem desafio;
  ValidationItem tema;

  CreateDesafioState({
    this.id = '',
    this.desafio = const ValidationItem(),
    this.tema = const ValidationItem(),
  });

  toDesafio() => Desafios(desafio: desafio.value, tema: tema.value);

  bool isValid() {
    if (desafio.value.isEmpty || tema.value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  CreateDesafioState copyWith(
          {ValidationItem? desafio, ValidationItem? tema}) =>
      CreateDesafioState(
          desafio: desafio ?? this.desafio, tema: tema ?? this.desafio);
}
