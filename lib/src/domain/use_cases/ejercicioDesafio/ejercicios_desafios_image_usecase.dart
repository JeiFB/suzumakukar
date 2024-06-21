import 'dart:io';

import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart';

class EjerciciosDesafiosImageUsecase {
  final EjerciciosDesafiosRepository _desafiosRepository;
  EjerciciosDesafiosImageUsecase(this._desafiosRepository);

  launch(String idDesafio, EjerciciosMultiple ejercicios, File image) =>
      _desafiosRepository.updateWithImg(idDesafio, ejercicios, image);
}
