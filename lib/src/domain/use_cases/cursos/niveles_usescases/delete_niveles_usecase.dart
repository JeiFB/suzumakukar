import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';

class DeleteNivelesUseCase {
  final CursosRepository _repository;

  DeleteNivelesUseCase(this._repository);

  launch(String idCurso, String idNivel) =>
      _repository.deleteNivel(idCurso, idNivel);
}
