import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/list/ejercicio_test_response.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/list/ejercicio_test_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class EjercicioTestPage extends StatelessWidget {
  const EjercicioTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    RolUser userRol = Provider.of<RolUser>(context);
    EjercicioTestViewModel vm = Provider.of<EjercicioTestViewModel>(context);
    DataResultados resultados = Provider.of<DataResultados>(context);
    Color letterColor = COLOR_BLACK_LAEL;
    Color themeColor = COLOR_PURPLE;
    return Scaffold(
        appBar: SuzumakukarAppBar(
            const Icon(Icons.arrow_back_ios_new_rounded), 'TEST', letterColor,
            () {
          resultados.reset();
          Navigator.pop(context);
        }, themeColor),
        body: EjercicioTestResponse(vm),
        floatingActionButton: userRol.rol
            ? FloatingActionButton(
                backgroundColor: COLOR_WHITE,
                child: const Icon(
                  Icons.add,
                  color: COLOR_PURPLE,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'createjerciciotest');
                },
              )
            : const SizedBox());
  }
}
