import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/list/ejercicio_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/list/widgets/ejercicios_desafio_content.dart';
import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_desafio.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class EjercicioDesafioPage extends StatelessWidget {
  const EjercicioDesafioPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = COLOR_PURPLE;
    Color letterColor = COLOR_BLACK_LAEL;
    RolUser userRol = Provider.of<RolUser>(context);
    EjercicioDesafioViewModel vm =
        Provider.of<EjercicioDesafioViewModel>(context);
    ObtenerIdDesafio idDesafio = Provider.of<ObtenerIdDesafio>(context);
    DataResultados resultados = Provider.of<DataResultados>(context);
    return Scaffold(
        appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new_rounded),
            'DESAFIOS', letterColor, () {
          resultados.reset();
          Navigator.pop(context);
        }, themeColor),
        body: StreamBuilder(
          stream: vm.getEjercicios(idDesafio.idDesafio ?? ''),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final response = snapshot.data;
            if (response is Error) {
              final data = response as Error;
              return Center(
                child: Text('Error: ${data.error}'),
              );
            }
            final ejerciciosList =
                response as Success<List<EjerciciosMultiple>>;
            return ejerciciosList.data.isNotEmpty
                ? EjerciciosDesafioContent(
                    idDesafio.idDesafio, ejerciciosList.data)
                : const Center(
                    child: Text('Sin Desafios'),
                  );
          }),
        ),
        floatingActionButton: userRol.rol
            ? FloatingActionButton(
                backgroundColor: COLOR_WHITE,
                child: const Icon(
                  Icons.add,
                  color: COLOR_PURPLE,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'createjerciciodesafio');
                },
              )
            : const SizedBox());
  }
}

// StreamBuilder(
//           stream: vm.getEjercicios(idDesafio.idDesafio ?? ''),
//           builder: ((context, snapshot) {
//             final response = snapshot.data;
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: Text(
//                   'No hay informacion',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               );
//             }
//             if (response is Error) {
//               final data = response as Error;
//               return Center(
//                 child: Text('Error: ${data.error}'),
//               );
//             }
//             final ejerciciosList =
//                 response as Success<List<EjerciciosMultiple>>;
//             return ejerciciosList.data.isNotEmpty
//                 ? EjerciciosDesafioContent(
//                     idDesafio.idDesafio, ejerciciosList.data)
//                 : const Center(
//                     child: Text('Sin Ejercicios'),
//                   );
//           }),
//         ),