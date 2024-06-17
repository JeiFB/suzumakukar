import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/create/create_ejercicio_response.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/create/create_ejercicio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/create/widgets/create_ejercicio_item.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_nivel.dart';

class CreateEjercicioPage extends StatelessWidget {
  const CreateEjercicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    ObtenerIdCurso idCurso = Provider.of<ObtenerIdCurso>(context);
    ObtenerIdNivel idNivel = Provider.of<ObtenerIdNivel>(context);
    Color appBarColor = COLOR_BLUE_MACAW;
    Color textColorAppBarr = COLOR_WHITE;
    CreateEjercicioViewModel vm =
        Provider.of<CreateEjercicioViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CreateEjercicioResponse(context, vm);
    });

    return Scaffold(
      appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new),
          'Crear ejercicio', textColorAppBarr, () {
        Navigator.pop(context);
      }, appBarColor),
      body: CreateEjercicioItem(idCurso.idCurso, idNivel.idNivel, vm),
    );
  }
}
