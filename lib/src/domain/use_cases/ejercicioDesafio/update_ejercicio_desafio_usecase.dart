import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart';

class UpdateEjercicioDesafioUseCase {
  final EjerciciosDesafiosRepository _repository;

  UpdateEjercicioDesafioUseCase(this._repository);
  launch(String idDesafio, EjerciciosMultiple ejercicios) =>
      _repository.update(idDesafio, ejercicios);
}
