import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_floatingactionbutton.dart';

import 'package:suzumakukar/src/presentation/pages/cursos/create/create_cursos_response.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/create/create_cursos_viewmodel.dart';

class CreateCursosPage extends StatelessWidget {
  const CreateCursosPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color iconColor = COLOR_GREEN_PASTEL;
    Color colorButtom = COLOR_GREEN_PASTEL;
    CreateCursosViewModel vm = Provider.of<CreateCursosViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CreateCursosResponse(context, vm);
    });
    return SuzumakukarFloatingActionButton(
        colorButtom,
        true,
        iconColor,
        'Agregar Curso',
        (value) {
          vm.changeName(value);
        },
        (value) => null,
        () {
          vm.createCurso();
          Navigator.pop(context);
        });
  }
}
