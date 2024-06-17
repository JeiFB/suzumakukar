import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/create_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/delete_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/get_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/update_ejercicio_desafio_usecase.dart';

class EjerciciosDesafioUseCases {
  CreateEjercicioDesafioUseCase createEjercicioDesafio;
  GetEjercicioDesafioUseCase getEjercicioDesafio;
  DeleteEjercicioDesafioUseCase deleteEjercicioDesafio;
  UpdateEjercicioDesafioUseCase updateEjercicioDesafioUseCase;
  EjerciciosDesafioUseCases({
    required this.createEjercicioDesafio,
    required this.getEjercicioDesafio,
    required this.deleteEjercicioDesafio,
    required this.updateEjercicioDesafioUseCase,
  });
}
