import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_card.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/list/niveles_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_nivel.dart';

class NivelesItem extends StatelessWidget {
  final Niveles niveles;
  final String idCurso;
  final NivelesViewModel vm;
  const NivelesItem(this.idCurso, this.vm, this.niveles, {super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = COLOR_RED_CARDINAL;
    Color textColor = COLOR_WHITE;
    Color editColor = COLOR_YELLOW_BEE;
    Color deleteColor = COLOR_GREEN_PASTEL;
    ObtenerIdNivel idEjercicio = Provider.of<ObtenerIdNivel>(context);
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'ejercicios',
              arguments: idEjercicio.nivelSeleccionado(niveles.id));
        },
        child: SuzumakukarCard(
            themeColor, niveles.nivel, textColor, niveles.tema, null, editColor,
            () {
          vm.deleteNivel(idCurso, niveles.id);
        }, deleteColor));
  }
}
