// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:suzumakukar/src/colors/base_color.dart';
// import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
// import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/update/ejercicio_test_update_response.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/update/ejercicio_test_update_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/ejerciciostest/update/widgets/ejercicio_test_update_content.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_test.dart';

// class EjercicioTestUpdatePage extends StatelessWidget {
//   const EjercicioTestUpdatePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Color appBarColor = COLOR_BLUE_MACAW;
//     Color textColorAppBarr = COLOR_WHITE;
//     ObtenerIdTest idTest = Provider.of<ObtenerIdTest>(context);
//     EjercicioTestUpdateViewModel vm =
//         Provider.of<EjercicioTestUpdateViewModel>(context);
//     EjerciciosMultiple ejerciciosArg =
//         ModalRoute.of(context)?.settings.arguments as EjerciciosMultiple;
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       EjercicioTestUpdateResponse(context, vm);
//     });

//     return Scaffold(
//       backgroundColor: COLOR_WHITE,
//       appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new),
//           'Actualizar ejercicio', textColorAppBarr, () {
//         Navigator.pop(context);
//       }, appBarColor),
//       body: FutureBuilder(
//           future: vm.loadData(ejerciciosArg),
//           builder: (context, _) =>
//               EjercicioTestUpdateContent(vm, idTest.idTest, ejerciciosArg)),
//     );
//   }
// }
