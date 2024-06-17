import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_test_repository.dart';

class UpdateEjercicioTestUseCase {
  final EjerciciosTestRepository _repository;

  UpdateEjercicioTestUseCase(this._repository);
  launch(String idTest, EjerciciosMultiple ejercicios) =>
      _repository.update(idTest, ejercicios);
}
