import 'package:suzumakukar/src/domain/use_cases/lectura/create_lectura_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/delete_lectura_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/get_lectura_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/update_lectura_usecase.dart';

class LecturaUseCases {
  CreateLecturaUseCase createLectura;
  DeleteLecturaUseCase deleteLectura;
  GetLecturaUseCase getLectura;
  UpdateLecturaUsecase updateLectura;

  LecturaUseCases(
      {required this.createLectura,
      required this.deleteLectura,
      required this.getLectura,
      required this.updateLectura});
}
