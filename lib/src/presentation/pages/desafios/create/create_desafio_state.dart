import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateDesafioState {
  String id;
  int desafioNumber;
  ValidationItem tema;

  CreateDesafioState({
    this.id = '',
    this.desafioNumber = 0,
    this.tema = const ValidationItem(),
  });

  toDesafio() => Desafios(desafio: desafioNumber, tema: tema.value);

  bool isValid() {
    if (desafioNumber.isNegative || tema.value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  CreateDesafioState copyWith({int? desafioNumber, ValidationItem? tema}) =>
      CreateDesafioState(
          desafioNumber: desafioNumber ?? this.desafioNumber,
          tema: tema ?? this.tema);
}
