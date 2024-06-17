import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_desafio.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/create/create_ejercicio_desafio_response.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/create/create_ejercicio_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/create/widgets/create_ejercicio_content.dart';

class CreateEjercicioDesafioPage extends StatelessWidget {
  const CreateEjercicioDesafioPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color appBarColor = COLOR_GREEN_PASTEL;
    Color textColor = COLOR_WHITE;
    CreateEjercicioDesafioViewModel vm =
        Provider.of<CreateEjercicioDesafioViewModel>(context);
    ObtenerIdDesafio desafio = Provider.of<ObtenerIdDesafio>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CreateEjercicioDesafioResponse(context, vm);
    });
    return Scaffold(
      appBar: SuzumakukarAppBar(
          const Icon(Icons.arrow_back_ios_new), 'Crear ejercicio', textColor,
          () {
        Navigator.pop(context);
      }, appBarColor),
      body: CreateEjercicioContent(vm, desafio.idDesafio),
    );
  }
}
