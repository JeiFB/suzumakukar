import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetEjerciciosUseCase {
  final CursosRepository _repository;

  GetEjerciciosUseCase(this._repository);

  Stream<Resource<List<Ejercicios>>> launch(
          String idCurso, String idEjercicios) =>
      _repository.getEjerciciosId(idCurso, idEjercicios);
}
