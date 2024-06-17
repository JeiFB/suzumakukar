import 'package:suzumakukar/src/domain/repository/desafios_respository.dart';

class DeleteDesafiosUseCase {
  final DesafiosRepository _repository;
  DeleteDesafiosUseCase(this._repository);

  launch(String id) => _repository.deleteDesafios(id);
}
