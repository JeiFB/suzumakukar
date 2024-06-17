import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';

class UpdateEjercicioUseCase {
  final CursosRepository _repository;

  UpdateEjercicioUseCase(this._repository);
  launch(String idCurso, String idNivel, Ejercicios ejercicios) =>
      _repository.update(idCurso, idNivel, ejercicios);
}
