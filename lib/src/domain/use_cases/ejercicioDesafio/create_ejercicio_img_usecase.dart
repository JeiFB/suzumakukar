import 'dart:io';

import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart';

class CreateEjercicioImgUsecase {
  final EjerciciosDesafiosRepository _desafioRepository;
  CreateEjercicioImgUsecase(this._desafioRepository);
  launch(String idDesafio, EjerciciosMultiple ejercicio, File image) =>
      _desafioRepository.createWithImgEjercicio(idDesafio, ejercicio, image);
}
