// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:suzumakukar/src/colors/base_color.dart';
// import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/create/create_ejercicio_test_response.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/create/create_ejercicio_test_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/create/widgets/create_ejercicio_test_content.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_test.dart';

// class CreateEjercicioTestPage extends StatelessWidget {
//   const CreateEjercicioTestPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Color appBarColor = COLOR_GREEN_PASTEL;
//     Color textColor = COLOR_WHITE;
//     CreateEjercicioTestViewModel vm =
//         Provider.of<CreateEjercicioTestViewModel>(context);
//     ObtenerIdTest test = Provider.of<ObtenerIdTest>(context);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       CreateEjercicioTestResponse(context, vm);
//     });
//     return Scaffold(
//       appBar: SuzumakukarAppBar(
//           const Icon(Icons.arrow_back_ios_new), 'Crear ejercicio', textColor,
//           () {
//         Navigator.pop(context);
//       }, appBarColor),
//       body: CreateEjercicioTestContent(vm, test.idTest),
//     );
//   }
// }
