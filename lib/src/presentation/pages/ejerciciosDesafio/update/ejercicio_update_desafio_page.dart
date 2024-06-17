import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/update/widgets/ejercicio_update_content.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/update/ejercicio_update_desafio_response.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/update/ejercicio_update_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/update/widgets/ejercicio_update_desafio_content.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_desafio.dart';

class EjercicioUpdateDesafioPage extends StatelessWidget {
  const EjercicioUpdateDesafioPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color appBarColor = COLOR_BLUE_MACAW;
    Color textColorAppBarr = COLOR_WHITE;
    ObtenerIdDesafio idDesafio = Provider.of<ObtenerIdDesafio>(context);
    EjercicioUpdateDesafioViewModel vm =
        Provider.of<EjercicioUpdateDesafioViewModel>(context);
    EjerciciosMultiple ejerciciosArg =
        ModalRoute.of(context)?.settings.arguments as EjerciciosMultiple;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      EjercicioUpdateDesafioResponse(context, vm);
    });

    return Scaffold(
      backgroundColor: COLOR_WHITE,
      appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new),
          'Actualizar ejercicio', textColorAppBarr, () {
        Navigator.pop(context);
      }, appBarColor),
      body: FutureBuilder(
          future: vm.loadData(ejerciciosArg),
          builder: (context, _) => EjercicioUpdateDesafioContent(
              vm, idDesafio.idDesafio, ejerciciosArg)),
    );
  }
}
