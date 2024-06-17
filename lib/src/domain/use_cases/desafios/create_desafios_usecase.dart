import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/domain/repository/desafios_respository.dart';

class CreateDesafiosUseCase {
  final DesafiosRepository _repository;

  CreateDesafiosUseCase(this._repository);

  launch(Desafios desafio) => _repository.createDesafios(desafio);
}
