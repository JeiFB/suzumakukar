import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/domain/repository/lectura_respository.dart';

class CreateLecturaUseCase {
  final LecturaRepository _repository;
  CreateLecturaUseCase(this._repository);

  launch(Lectura lectura) => _repository.createLectura(lectura);
}
