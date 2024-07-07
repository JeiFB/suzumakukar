import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/domain/repository/lectura_respository.dart';

class UpdateLecturaUsecase {
  final LecturaRepository _lecturaRepository;
  UpdateLecturaUsecase(this._lecturaRepository);

  launch(Lectura lectura) => _lecturaRepository.updateLectura(lectura);
}
