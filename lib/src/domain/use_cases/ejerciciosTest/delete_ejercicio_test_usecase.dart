import 'package:suzumakukar/src/domain/repository/ejercicios_test_repository.dart';

class DeleteEjercicioTestUseCase {
  final EjerciciosTestRepository _repository;

  DeleteEjercicioTestUseCase(this._repository);

  launch(String idTest, String idEjercicio) =>
      _repository.deleteEjercicio(idTest, idEjercicio);
}
