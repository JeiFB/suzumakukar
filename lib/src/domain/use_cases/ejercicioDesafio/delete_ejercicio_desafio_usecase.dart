import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart';

class DeleteEjercicioDesafioUseCase {
  final EjerciciosDesafiosRepository _desafiosRepository;

  DeleteEjercicioDesafioUseCase(this._desafiosRepository);

  launch(String idDesafio, String idEjercicio) =>
      _desafiosRepository.deleteEjercicio(idDesafio, idEjercicio);
}
