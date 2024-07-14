import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_response.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class EjerciciosPage extends StatelessWidget {
  const EjerciciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color letterColor = COLOR_BLACK_LAEL;
    Color themeColor = COLOR_YELLOW_BEE;
    final Map ids = ModalRoute.of(context)?.settings.arguments as Map;
    EjerciciosViewModel vm = Provider.of<EjerciciosViewModel>(context);
    RolUser rolUser = Provider.of<RolUser>(context);
    DataResultados resultados = Provider.of<DataResultados>(context);
    return Scaffold(
      appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new_rounded),
          'ACTIVIDAD', letterColor, () {
        resultados.reset();
        Navigator.pop(context);
      }, themeColor),
      body: EjerciciosResponse(vm, ids['idCurso'], ids['idNivel']),
      floatingActionButton: rolUser.rolUser
          ? FloatingActionButton(
              backgroundColor: COLOR_WHITE,
              child: const Icon(
                Icons.add,
                color: COLOR_YELLOW_BEE,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'createjercicio', arguments: {
                  'idCurso': ids['idCurso'],
                  'idNivel': ids['idNivel']
                });
              },
            )
          : null,
    );
  }
}
