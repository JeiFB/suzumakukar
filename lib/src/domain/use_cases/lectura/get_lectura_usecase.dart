import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/domain/repository/lectura_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetLecturaUseCase {
  final LecturaRepository _repository;

  GetLecturaUseCase(this._repository);

  Stream<Resource<List<Lectura>>> launch() => _repository.getLectura();
}
