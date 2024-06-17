import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_test_repository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetEjercicioTestUseCase {
  final EjerciciosTestRepository _repository;

  GetEjercicioTestUseCase(this._repository);

  Stream<Resource<List<EjerciciosMultiple>>> launch(String idTest) =>
      _repository.getEjercicios(idTest);
}
