import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_card.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/list/desafios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_desafio.dart';

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
    // Color themeColor = COLOR_ORANGE_FOX;
    Color textColor = COLOR_WHITE;
    Color editColor = COLOR_YELLOW_BEE;
    Color deleteColor = COLOR_RED_CARDINAL;
    ObtenerIdDesafio desafio = Provider.of<ObtenerIdDesafio>(context);
    return GestureDetector(
      onTap: !isCompleted
          ? () {
              Navigator.pushNamed(
                context,
                'ejerciciosdesafiopage',
                arguments: desafio.setDesafioSeleccionado(desafios.id),
              );
              desafio.setDesafioNumber(desafios.desafio);
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
