import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/list/niveles_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/widgets/niveles_item.dart';

class NivelesResponse extends StatefulWidget {
  const NivelesResponse({super.key});

  @override
  State<NivelesResponse> createState() => _NivelesResponseState();
}

class _NivelesResponseState extends State<NivelesResponse> {
  @override
  Widget build(BuildContext context) {
    ObtenerIdCurso curso = Provider.of<ObtenerIdCurso>(context);
    NivelesViewModel vm = Provider.of<NivelesViewModel>(context);
    return StreamBuilder(
      stream: vm.getNiveles(curso.idCurso ?? ''),
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
        final nivelesList = response as Success<List<Niveles>>;

        return GridView.builder(
            itemCount: nivelesList.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.9,
                // crossAxisSpacing: 1.5,
                mainAxisExtent: 210),
            itemBuilder: (context, index) {
              final nivel = nivelesList.data[index];
              return nivelesList.data.isNotEmpty
                  ? NivelesItem(curso.idCurso, vm, nivel)
                  : const Center(
                      child: Text('No hay niveles'),
                    );
            });
      }),
    );
  }
}
