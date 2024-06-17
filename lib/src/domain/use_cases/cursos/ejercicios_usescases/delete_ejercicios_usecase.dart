import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';

class DeleteEjerciciosUseCase {
  final CursosRepository _cursosRepository;

  DeleteEjerciciosUseCase(this._cursosRepository);

  launch(String idCurso, String idNivel, String idEjercicio) =>
      _cursosRepository.deleteEjercicio(idCurso, idNivel, idEjercicio);
}
