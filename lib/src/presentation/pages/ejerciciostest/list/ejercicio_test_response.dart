// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/list/ejercicio_test_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/list/widgets/ejercicio_test_content.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_test.dart';

// class EjercicioTestResponse extends StatelessWidget {
//   final EjercicioTestViewModel vm;
//   const EjercicioTestResponse(this.vm, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     ObtenerIdTest idTest = Provider.of<ObtenerIdTest>(context);

//     return StreamBuilder(
//       stream: vm.getEjercicios(idTest.idTest ?? ''),
//       builder: ((context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         final response = snapshot.data;
//         if (response is Error) {
//           final data = response as Error;
//           return Center(
//             child: Text('Error: ${data.error}'),
//           );
//         }
//         final ejerciciosList = response as Success<List<EjerciciosMultiple>>;
//         return ejerciciosList.data.isNotEmpty
//             ? EjerciciosTestContent(idTest.idTest, ejerciciosList.data)
//             : const Center(
//                 child: Text('Sin test'),
//               );
//       }),
//     );
//   }
// }
