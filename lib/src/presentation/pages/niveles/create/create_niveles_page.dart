import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_floatingactionbutton.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/create/create_niveles_response.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/create/create_niveles_viewmodel.dart';

class CreateNivelesPage extends StatelessWidget {
  const CreateNivelesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color iconColor = COLOR_RED_CARDINAL;
    Color colorButtom = COLOR_RED_CARDINAL;
    CreateNivelesViewModel vm = Provider.of<CreateNivelesViewModel>(context);
    ObtenerIdCurso curso = Provider.of<ObtenerIdCurso>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CreateNivelesResponse(context, vm);
    });
    return SuzumakukarFloatingActionButton(
        colorButtom, false, iconColor, 'Nivel', (value) {
      vm.changeName(value);
    }, (value) {
      vm.changeTema(value);
    }, () {
      vm.createNivel(curso.idCurso);
      Navigator.pop(context);
    });
  }
}
