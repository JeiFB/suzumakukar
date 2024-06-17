import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/create_ejercicio_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/delete_ejercicio_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/get_ejercicio_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/update_ejercicio_test_usecase.dart';

class EjerciciosTestUseCases {
  CreateEjercicioTestUseCase createEjercicioTest;
  GetEjercicioTestUseCase getEjercicioTest;
  DeleteEjercicioTestUseCase deleteEjercicioTest;
  UpdateEjercicioTestUseCase updateEjercicioTestUseCase;
  EjerciciosTestUseCases({
    required this.createEjercicioTest,
    required this.getEjercicioTest,
    required this.deleteEjercicioTest,
    required this.updateEjercicioTestUseCase,
  });
}
