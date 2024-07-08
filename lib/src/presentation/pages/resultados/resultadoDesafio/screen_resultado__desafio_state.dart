import 'package:suzumakukar/src/domain/models/completedChallenges.dart';

class ScreenResultadoDesafioState {
  final String id;
  final int desafioNumber;
  final String nota;
  final bool realizado;
  ScreenResultadoDesafioState(
      {this.id = '',
      this.desafioNumber = 0,
      this.nota = '',
      this.realizado = true});

  toResults() => CompletedChallenges(
      idDesafio: id,
      desafioNumber: desafioNumber,
      nota: nota,
      realizado: realizado);

  ScreenResultadoDesafioState copyWith(
          {String? id, int? desafioNumber, String? nota, bool? realizado}) =>
      ScreenResultadoDesafioState(
          id: id ?? this.id,
          desafioNumber: desafioNumber ?? this.desafioNumber,
          nota: nota ?? this.nota,
          realizado: realizado ?? this.realizado);
}
