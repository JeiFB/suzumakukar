import 'package:suzumakukar/src/domain/models/cursos.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';

class CreateCursosUseCase {
  final CursosRepository _repository;
  CreateCursosUseCase(this._repository);

  launch(Cursos curso) => _repository.createCurso(curso);
}
