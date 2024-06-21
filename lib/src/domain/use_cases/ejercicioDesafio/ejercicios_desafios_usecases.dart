import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/create_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/create_ejercicio_img_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/delete_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_image_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/get_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/update_ejercicio_desafio_usecase.dart';

class EjerciciosDesafioUseCases {
  CreateEjercicioDesafioUseCase createEjercicioDesafio;
  CreateEjercicioImgUsecase createEjercicioImgUsecase;
  GetEjercicioDesafioUseCase getEjercicioDesafio;
  DeleteEjercicioDesafioUseCase deleteEjercicioDesafio;
  UpdateEjercicioDesafioUseCase updateEjercicioDesafioUseCase;
  EjerciciosDesafiosImageUsecase ejerciciosDesafiosImageUsecase;
  EjerciciosDesafioUseCases(
      {required this.createEjercicioDesafio,
      required this.getEjercicioDesafio,
      required this.deleteEjercicioDesafio,
      required this.updateEjercicioDesafioUseCase,
      required this.ejerciciosDesafiosImageUsecase,
      required this.createEjercicioImgUsecase});
}
