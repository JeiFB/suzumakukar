import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetNiveles {
  final CursosRepository _repository;

  GetNiveles(this._repository);

  Stream<Resource<List<Niveles>>> launch(String id) =>
      _repository.getNivelesId(id);
}
