// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_desafio.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/list/ejercicio_desafio_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/list/widgets/ejercicios_desafio_content.dart';

// class EjercicioDesafioResponse extends StatelessWidget {
//   final EjercicioDesafioViewModel vm;
//   const EjercicioDesafioResponse(this.vm, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     ObtenerIdDesafio idDesafio = Provider.of<ObtenerIdDesafio>(context);

//     return StreamBuilder(
//       stream: vm.getEjercicios(idDesafio.idDesafio ?? ''),
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
//             ? EjerciciosDesafioContent(idDesafio.idDesafio, ejerciciosList.data)
//             : const Center(
//                 child: Text('Sin deafios'),
//               );
//       }),
//     );
//   }
// }
