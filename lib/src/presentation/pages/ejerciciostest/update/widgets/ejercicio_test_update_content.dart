// import 'package:flutter/material.dart';
// import 'package:suzumakukar/src/colors/base_color.dart';
// import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
// import 'package:suzumakukar/src/presentation/components/suszumakukar_opcionesrespuesta.dart';
// import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
// import 'package:suzumakukar/src/presentation/components/suzumakukar_createejercicio.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/update/ejercicio_test_update_viewmodel.dart';

// class EjercicioTestUpdateContent extends StatelessWidget {
//   final EjercicioTestUpdateViewModel vm;
//   final String idTest;
//   final EjerciciosMultiple ejercicios;
//   const EjercicioTestUpdateContent(this.vm, this.idTest, this.ejercicios,
//       {super.key});

//   @override
//   Widget build(BuildContext context) {
//     Color boton = COLOR_BLUE_MACAW;
//     Color textBoton = COLOR_WHITE;
//     return ListView(
//       children: [
//         SuzumakukarCreateEjercicio(
//             initialEjercicio: ejercicios.ejercicio,
//             initialPlanteamiento: ejercicios.descripcion,
//             initialRespuesta: ejercicios.opciones[0],
//             respuesta: 'Respuesta',
//             onChangeEjercicio: (value) {
//               vm.changeEjercicio(value);
//             },
//             onChangeDescripcion: (value) {
//               vm.changeDescripcion(value);
//             },
//             onChangeRespuesta: (value) {
//               vm.changeRespuesta(value);
//               vm.changeOpcion(value, index: 0);
//             }),
//         Column(
//           children: [
//             SuzumakukarOpcionesRespuesta(
//                 initialValue: ejercicios.opciones[1], '2', (value) {
//               vm.changeOpcion(value, index: 1);
//             }),
//             SuzumakukarOpcionesRespuesta(
//                 initialValue: ejercicios.opciones[2], '3', (value) {
//               vm.changeOpcion(value, index: 2);
//             }),
//             SuzumakukarOpcionesRespuesta(
//                 initialValue: ejercicios.opciones[3], '4', (value) {
//               vm.changeOpcion(value, index: 3);
//             }),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20),
//           child: SuzumakukarButton(
//               texto: 'Editar ejercicio',
//               onPressed: () {
//                 vm.updateEjercicio(idTest);
//               },
//               color: boton,
//               textColor: textBoton),
//         )
//       ],
//     );
//   }
// }
