import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/domain/repository/desafios_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetDesafiosUseCase {
  final DesafiosRepository _repository;

  GetDesafiosUseCase(this._repository);

  Stream<Resource<List<Desafios>>> launch() => _repository.getDesafios();
}
