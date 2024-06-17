import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart';

class CreateEjercicioDesafioUseCase {
  final EjerciciosDesafiosRepository _repository;

  CreateEjercicioDesafioUseCase(this._repository);

  launch(String idDesafio, EjerciciosMultiple ejercicio) =>
      _repository.createEjercicio(idDesafio, ejercicio);
}
