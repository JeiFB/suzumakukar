import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_card.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/list/niveles_viewmodel.dart';

class NivelesItem extends StatelessWidget {
  final Niveles niveles;
  final String idCurso;
  final NivelesViewModel vm;
  const NivelesItem(this.idCurso, this.vm, this.niveles, {super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = COLOR_RED_CARDINAL;
    Color textColor = COLOR_WHITE;
    Color editColor = COLOR_GREEN_PASTEL;
    Color deleteColor = COLOR_YELLOW_BEE;
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'ejercicios',
              arguments: {'idCurso': idCurso, 'idNivel': niveles.id});
        },
        child: SuzumakukarCard(
            themeColor,
            challengeNumber: 'Nivel ${niveles.nivel}',
            textColor,
            niveles.tema,
            null,
            editColor, () {
          vm.deleteNivel(idCurso, niveles.id);
        }, deleteColor));
  }
}
