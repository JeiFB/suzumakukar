import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';

class CreateEjerciciosUseCase {
  final CursosRepository _cursosRepository;

  CreateEjerciciosUseCase(this._cursosRepository);

  launch(String idCurso, String idNivel, Ejercicios ejercicio) =>
      _cursosRepository.createEjercicio(idCurso, idNivel, ejercicio);
}
