import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suszumakukar_opcionesrespuesta.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_createejercicio.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/create/create_ejercicio_test_viewmodel.dart';

class CreateEjercicioTestContent extends StatelessWidget {
  final CreateEjercicioTestViewModel vm;
  final String idTest;
  const CreateEjercicioTestContent(this.vm, this.idTest, {super.key});

  @override
  Widget build(BuildContext context) {
    Color boton = COLOR_BLUE_MACAW;
    Color textBoton = COLOR_WHITE;
    return ListView(
      children: [
        SuzumakukarCreateEjercicio(
            respuesta: 'Respuesta',
            onChangeEjercicio: (value) {
              vm.changeEjercicio(value);
            },
            onChangeDescripcion: (value) {
              vm.changeDescripcion(value);
            },
            onChangeRespuesta: (value) {
              vm.changeRespuesta(value);
              vm.changeOpcion(value, index: 0);
            }),
        Column(
          children: [
            SuzumakukarOpcionesRespuesta('2', (value) {
              vm.changeOpcion(value, index: 1);
            }),
            SuzumakukarOpcionesRespuesta('3', (value) {
              vm.changeOpcion(value, index: 2);
            }),
            SuzumakukarOpcionesRespuesta('4', (value) {
              vm.changeOpcion(value, index: 3);
            }),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SuzumakukarButton(
              texto: 'Agregar',
              onPressed: () {
                print('ejercicio presionado');
                vm.createEjercicio(idTest);
              },
              color: boton,
              textColor: textBoton),
        )
      ],
    );
  }
}
