import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';

class DeleteCursoUsecase {
  final CursosRepository _repository;

  DeleteCursoUsecase(this._repository);

  launch(String id) => _repository.deleteCurso(id);
}
