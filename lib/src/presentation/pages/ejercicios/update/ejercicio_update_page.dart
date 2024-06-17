import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/update/ejercicio_update_response.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/update/ejercicio_update_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/update/widgets/ejercicio_update_content.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_nivel.dart';

class EjercicioUpdatePage extends StatelessWidget {
  const EjercicioUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color appBarColor = COLOR_BLUE_MACAW;
    Color textColorAppBarr = COLOR_WHITE;
    ObtenerIdCurso idCurso = Provider.of<ObtenerIdCurso>(context);
    ObtenerIdNivel idNivel = Provider.of<ObtenerIdNivel>(context);
    EjercicioUpdateViewModel vm =
        Provider.of<EjercicioUpdateViewModel>(context);
    Ejercicios ejerciciosArg =
        ModalRoute.of(context)?.settings.arguments as Ejercicios;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      EjercicioUpdateResponse(context, vm);
    });

    return Scaffold(
      backgroundColor: COLOR_WHITE,
      appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new),
          'Actualizar ejercicio', textColorAppBarr, () {
        Navigator.pop(context);
      }, appBarColor),
      body: FutureBuilder(
          future: vm.loadData(ejerciciosArg),
          builder: (context, _) => EjercicioUpdateContent(
              idCurso.idCurso, idNivel.idNivel, vm, ejerciciosArg)),
    );
  }
}
