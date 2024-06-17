import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_ejercicios_content.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/list/ejercicio_test_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/update/ejercicio_test_update_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_ejercicio.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_test.dart';

class EjerciciosTestContent extends StatefulWidget {
  final String idTest;
  final List<EjerciciosMultiple> ejerciciosList;
  const EjerciciosTestContent(this.idTest, this.ejerciciosList, {super.key});

  @override
  State<EjerciciosTestContent> createState() => _EjerciciosTestContent();
}

class _EjerciciosTestContent extends State<EjerciciosTestContent> {
  @override
  Widget build(BuildContext context) {
    ObtenerIdTest idTest = Provider.of<ObtenerIdTest>(context);
    ObtenerIdEjercicio idEjercicio = Provider.of<ObtenerIdEjercicio>(context);
    EjercicioTestUpdateViewModel vmUpdate =
        Provider.of<EjercicioTestUpdateViewModel>(context);
    Color themeColor = COLOR_PURPLE;
    Color shadowColor = COLOR_PURPLE_OSCURE;
    Color bgColor = COLOR_WHITE_POLAR;
    EjercicioTestViewModel vm = Provider.of<EjercicioTestViewModel>(context);
    return Scaffold(
        backgroundColor: bgColor,
        resizeToAvoidBottomInset: false,
        body: SuzumakukarEjerciciosContent('ejerciciostestupdatepage', () {
          vmUpdate.resetData();
        }, () {
          vm.deleteEjercicio(idTest.idTest, idEjercicio.idEjercicio);
        }, shadowColor, themeColor, widget.ejerciciosList, true, false));
  }
}
