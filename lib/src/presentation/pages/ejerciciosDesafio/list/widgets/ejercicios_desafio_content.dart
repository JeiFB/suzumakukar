import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_ejercicios_content.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/list/ejercicio_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/update/ejercicio_update_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_desafio.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_ejercicio.dart';

class EjerciciosDesafioContent extends StatefulWidget {
  final String idDesafio;
  final List<EjerciciosMultiple> ejerciciosList;
  const EjerciciosDesafioContent(this.idDesafio, this.ejerciciosList,
      {super.key});

  @override
  State<EjerciciosDesafioContent> createState() => _EjerciciosDesafioContent();
}

class _EjerciciosDesafioContent extends State<EjerciciosDesafioContent> {
  @override
  Widget build(BuildContext context) {
    Color themeColor = COLOR_PURPLE;
    Color shadowColor = COLOR_PURPLE_OSCURE;
    Color bgColor = COLOR_WHITE_POLAR;
    EjercicioDesafioViewModel vm =
        Provider.of<EjercicioDesafioViewModel>(context);
    EjercicioUpdateDesafioViewModel vmUpdate =
        Provider.of<EjercicioUpdateDesafioViewModel>(context);
    ObtenerIdDesafio idDesafio = Provider.of<ObtenerIdDesafio>(context);
    ObtenerIdEjercicio idEjercicio = Provider.of<ObtenerIdEjercicio>(context);
    return Scaffold(
        backgroundColor: bgColor,
        resizeToAvoidBottomInset: false,
        body: SuzumakukarEjerciciosContent('ejercicioupdatedesafio', () {
          vmUpdate.resetData();
        }, () {
          vm.deleteEjercicio(idDesafio.idDesafio, idEjercicio.idEjercicio);
        }, shadowColor, themeColor, widget.ejerciciosList, true, false));
  }
}
