import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/widgets/ejercicios_content.dart';

class EjerciciosResponse extends StatelessWidget {
  final String idCurso;
  final String idNivel;
  final EjerciciosViewModel vm;
  const EjerciciosResponse(this.vm, this.idCurso, this.idNivel, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: vm.getEjercicios(idCurso, idNivel),
      builder: ((context, snapshot) {
        final response = snapshot.data;
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (response is Error) {
          final data = response as Error;
          return Center(
            child: Text('Error: ${data.error}'),
          );
        }
        final ejerciciosList = response as Success<List<Ejercicios>>;
        return ejerciciosList.data.isNotEmpty
            ? EjerciciosContent(idCurso, idNivel, ejerciciosList.data,
                ejerciciosList.data.length)
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
