import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_alert_dialog.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_response.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/widgets/ejercicios_content.dart';
import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_nivel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class EjerciciosPage extends StatelessWidget {
  const EjerciciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color letterColor = COLOR_BLACK_LAEL;
    Color themeColor = COLOR_YELLOW_BEE;
    // ObtenerIdCurso idCurso = Provider.of<ObtenerIdCurso>(context);
    // ObtenerIdNivel idNivel = Provider.of<ObtenerIdNivel>(context);
    EjerciciosViewModel vm = Provider.of<EjerciciosViewModel>(context);
    RolUser rolUser = Provider.of<RolUser>(context);
    DataResultados resultados = Provider.of<DataResultados>(context);
    return Scaffold(
      appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new_rounded),
          'ACTIVIDAD', letterColor, () {
        resultados.reset();
        Navigator.pop(context);
      }, themeColor),
      body: EjerciciosResponse(vm),
      floatingActionButton: rolUser.rolUser
          ? FloatingActionButton(
              backgroundColor: COLOR_WHITE,
              child: const Icon(
                Icons.add,
                color: COLOR_YELLOW_BEE,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'createjercicio');
              },
            )
          : null,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:suzumakukar/src/colors/base_color.dart';
// import 'package:suzumakukar/src/domain/models/ejercicios.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/components/suzumakukar_alert_dialog.dart';
// import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
// import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_response.dart';
// import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/ejercicios/list/widgets/ejercicios_content.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_nivel.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

// class EjerciciosPage extends StatelessWidget {
//   const EjerciciosPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Color letterColor = COLOR_BLACK_LAEL;
//     Color themeColor = COLOR_YELLOW_BEE;

//     ObtenerIdCurso idCurso = Provider.of<ObtenerIdCurso>(context);
//     ObtenerIdNivel idNivel = Provider.of<ObtenerIdNivel>(context);
//     EjerciciosViewModel vm = Provider.of<EjerciciosViewModel>(context);
//     RolUser rolUser = Provider.of<RolUser>(context);
//     DataResultados resultados = Provider.of<DataResultados>(context);

//     return Scaffold(
//       appBar: SuzumakukarAppBar(
//         const Icon(Icons.arrow_back_ios_new_rounded),
//         'ACTIVIDAD',
//         letterColor,
//         () {
//           resultados.reset();
//           Navigator.pop(context);
//         },
//         themeColor,
//       ),
//       body: 
//       StreamBuilder<Resource<List<Ejercicios>>>(
//         stream: 
//         vm.getEjercicios(idCurso.idCurso, idNivel.idNivel),
//         builder: (context, snapshot) {
//           print('cargando dato ${snapshot.connectionState}');
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           if (!snapshot.hasData) {
//             return const Center(
//               child: Text('cargando...'),
//             );
//           }

//           final response = snapshot.data;

//           if (response is Error) {
//             return const Center(
//               child: Text('Error'),
//             );
//           }

//           if (response is Success<List<Ejercicios>>) {
//             final ejerciciosList = response.data;

//             if (ejerciciosList.isEmpty) {
//               return const Center(
//                 child: Text(
//                   'Sin ejercicios',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Feather Bold',
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               );
//             }

//             return EjerciciosContent(
//               idCurso.idCurso,
//               idNivel.idNivel,
//               ejerciciosList,
//               ejerciciosList.length,
//             );
//           }

//           return const Center(
//             child: Text('Estado desconocido'),
//           );
//         },
//       ),
//       floatingActionButton: rolUser.rolUser
//           ? FloatingActionButton(
//               backgroundColor: COLOR_WHITE,
//               child: const Icon(
//                 Icons.add,
//                 color: COLOR_YELLOW_BEE,
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, 'createjercicio');
//               },
//             )
//           : null,
//     );
//   }
// }








// EjerciciosResponse(vm),
      //     StreamBuilder(
      //   stream: vm.getEjercicios(idCurso.idCurso, idNivel.idNivel),
      //   builder: ((context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     final response = snapshot.data;
      //     if (response is Error) {
      //       final data = response as Error;
      //       return Center(
      //         child: Text('Error: ${data.error}'),
      //       );
      //     }
      //     final ejerciciosList = response as Success<List<Ejercicios>>;

      //     return Text('sin desafios');
      //     // ejerciciosList.data.isNotEmpty
      //     //     ? EjerciciosContent(idCurso.idCurso, idNivel.idNivel,
      //     //         ejerciciosList.data, ejerciciosList.data.length)
      //     //     : const Center(
      //     //         child: Text(
      //     //           'Sin ejercicios',
      //     //           textAlign: TextAlign.center,
      //     //           style: TextStyle(
      //     //             fontFamily: 'Feather Bold',
      //     //             fontSize: 20,
      //     //             fontWeight: FontWeight.bold,
      //     //             // color: textColor,
      //     //           ),
      //     //         ),
      //     //       );
      //   }),
      // ),