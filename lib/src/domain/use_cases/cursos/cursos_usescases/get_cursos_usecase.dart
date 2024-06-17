import 'package:suzumakukar/src/domain/models/cursos.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetCursosUseCase {
  final CursosRepository _repository;

  GetCursosUseCase(this._repository);

  Stream<Resource<List<Cursos>>> launch() => _repository.getCursos();
}
