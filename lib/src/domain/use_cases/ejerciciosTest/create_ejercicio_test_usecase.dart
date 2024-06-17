import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_test_repository.dart';

class CreateEjercicioTestUseCase {
  final EjerciciosTestRepository _repository;

  CreateEjercicioTestUseCase(this._repository);

  launch(String idTest, EjerciciosMultiple ejercicio) =>
      _repository.createEjercicio(idTest, ejercicio);
}
