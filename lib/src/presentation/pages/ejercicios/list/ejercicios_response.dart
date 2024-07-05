import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/widgets/ejercicios_content.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_nivel.dart';

class EjerciciosResponse extends StatelessWidget {
  final EjerciciosViewModel vm;
  const EjerciciosResponse(this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    ObtenerIdCurso idCurso = Provider.of<ObtenerIdCurso>(context);
    ObtenerIdNivel idNivel = Provider.of<ObtenerIdNivel>(context);

    return StreamBuilder(
      stream: vm.getEjercicios(idCurso.idCurso ?? '', idNivel.idNivel ?? ''),
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
        final ejerciciosList = response as Success<List<Ejercicios>>;

        return ejerciciosList.data.isNotEmpty
            ? EjerciciosContent(idCurso.idCurso, idNivel.idNivel,
                ejerciciosList.data, ejerciciosList.data.length)
            : const Center(
                child: Text(
                  'Sin ejercicios',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Feather Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // color: textColor,
                  ),
                ),
              );
      }),
    );
  }
}
