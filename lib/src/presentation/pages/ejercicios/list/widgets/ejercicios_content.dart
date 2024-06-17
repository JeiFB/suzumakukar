import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_ejercicios_content.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/update/ejercicio_update_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_ejercicio.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_nivel.dart';

class EjerciciosContent extends StatefulWidget {
  final String idCurso;
  final String idNivel;
  final List<Ejercicios> ejerciciosList;
  final int totalPreguntas;
  const EjerciciosContent(
      this.idCurso, this.idNivel, this.ejerciciosList, this.totalPreguntas,
      {super.key});

  @override
  State<EjerciciosContent> createState() => _EjerciciosContent();
}

class _EjerciciosContent extends State<EjerciciosContent> {
  @override
  Widget build(BuildContext context) {
    Color themeColor = COLOR_YELLOW_BEE;
    Color showColor = COLOR_YELLOW_BEE_OSCURE;
    Color bgColor = COLOR_WHITE_POLAR;
    EjerciciosViewModel vm = Provider.of<EjerciciosViewModel>(context);
    EjercicioUpdateViewModel vmUpdate =
        Provider.of<EjercicioUpdateViewModel>(context);
    ObtenerIdCurso idCurso = Provider.of<ObtenerIdCurso>(context);
    ObtenerIdNivel idNivel = Provider.of<ObtenerIdNivel>(context);
    ObtenerIdEjercicio idEjercicio = Provider.of<ObtenerIdEjercicio>(context);

    return Scaffold(
        backgroundColor: bgColor,
        resizeToAvoidBottomInset: false,
        body: SuzumakukarEjerciciosContent('updateejercicio', () {
          vmUpdate.resetData();
        }, () {
          vm.deleteEjercicio(
              idCurso.idCurso, idNivel.idNivel, idEjercicio.idEjercicio);
        }, showColor, themeColor, widget.ejerciciosList, false, true));
  }
}
// }
