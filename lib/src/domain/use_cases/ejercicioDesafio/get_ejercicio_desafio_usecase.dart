import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetEjercicioDesafioUseCase {
  final EjerciciosDesafiosRepository _repository;

  GetEjercicioDesafioUseCase(this._repository);

  Stream<Resource<List<EjerciciosMultiple>>> launch(String idDesafio) =>
      _repository.getEjercicios(idDesafio);
}
