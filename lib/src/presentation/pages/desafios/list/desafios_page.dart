import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/create/create_desafio_page.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/list/desafios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/list/widgets/desafios_page_content.dart';

class DesafiosPage extends StatelessWidget {
  const DesafiosPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = COLOR_WHITE;
    Color colorAppBar = COLOR_ORANGE_FOX;
    DesafiosViewModel vm = Provider.of<DesafiosViewModel>(context);
    return Scaffold(
      appBar: SuzumakukarAppBar(null, 'DESAFIOS', textColor, null, colorAppBar),
      body: StreamBuilder(
        stream: vm.getDesafios(),
        builder: (context, desafiosSnapshot) {
          if (desafiosSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!desafiosSnapshot.hasData) {
            return const Center(
                child: Text('No hay información',
                    style: TextStyle(color: Colors.white)));
          }
          final desafiosResponse = desafiosSnapshot.data;
          if (desafiosResponse is Error) {
            return Center(child: Text('Error: $desafiosResponse'));
          }
          final desafiosList =
              (desafiosResponse as Success<List<Desafios>>).data;

          return StreamBuilder(
            stream: vm.completedChallenges(),
            builder: (context, completedSnapshot) {
              if (completedSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              // if (!completedSnapshot.hasData) {
              //   return const Center(
              //       child: Text('No hay información',
              //           style: TextStyle(color: Colors.white)));
              // }
              final completedChallenges =
                  completedSnapshot.data as List<CompletedChallenges>;

              return GridView.builder(
                itemCount: desafiosList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.9,
                  mainAxisExtent: 210,
                ),
                itemBuilder: (context, index) {
                  final desafio = desafiosList[index];
                  final isCompleted = completedChallenges
                      .any((completed) => completed.idDesafio == desafio.id);
                  final color = isCompleted ? Colors.grey : Colors.orange;

                  return DesafiosPageContent(vm, desafio, color, isCompleted);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: const CreateDesafioPage(),
    );
  }
}
