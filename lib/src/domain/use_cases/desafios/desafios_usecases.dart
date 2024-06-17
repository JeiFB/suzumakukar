import 'package:suzumakukar/src/domain/use_cases/desafios/create_desafios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/delete_desafios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/get_desafios_usecase.dart';

class DesafiosUseCases {
  CreateDesafiosUseCase createDesafio;
  GetDesafiosUseCase getDesafios;
  DeleteDesafiosUseCase deleteDesafios;

  DesafiosUseCases(
      {required this.createDesafio,
      required this.getDesafios,
      required this.deleteDesafios});
}
