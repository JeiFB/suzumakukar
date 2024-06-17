import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';

class CreateNivelesUseCase {
  final CursosRepository _repository;

  CreateNivelesUseCase(this._repository);

  launch(Niveles nivel, String id) => _repository.createNiveles(nivel, id);
}
