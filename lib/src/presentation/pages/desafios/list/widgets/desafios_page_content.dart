import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_card.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/list/desafios_viewmodel.dart';

class DesafiosPageContent extends StatelessWidget {
  final Desafios desafios;
  final DesafiosViewModel vm;
  final Color color;
  final bool isCompleted;
  const DesafiosPageContent(
      this.vm, this.desafios, this.color, this.isCompleted,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = COLOR_WHITE;
    Color editColor = COLOR_YELLOW_BEE;
    Color deleteColor = COLOR_RED_CARDINAL;
    return GestureDetector(
      onTap: !isCompleted
          ? () {
              Navigator.pushNamed(context, 'ejerciciosdesafiopage', arguments: {
                'idDesafio': desafios.id,
                'numberDesafio': desafios.desafio
              });
            }
          : null,
      child: SuzumakukarCard(
        color,

        // desafios.desafio,
        challengeNumber: 'Desafio ${desafios.desafio}',
        textColor,
        desafios.tema,
        null,
        editColor,
        () {
          vm.deleteDesafio(desafios.id);
        },
        deleteColor,
      ),
    );
  }
}
