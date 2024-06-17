import 'package:suzumakukar/src/domain/repository/lectura_respository.dart';

class DeleteLecturaUseCase {
  final LecturaRepository _repository;
  DeleteLecturaUseCase(this._repository);

  launch(String id) => _repository.deleteLectura(id);
}
