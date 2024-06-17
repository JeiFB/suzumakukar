import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
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
        appBar:
            SuzumakukarAppBar(null, 'DESAFIOS', textColor, null, colorAppBar),
        body: StreamBuilder(
          stream: vm.getDesafios(),
          builder: ((context, snapshot) {
            final response = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'No hay informacion',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            if (response is Error) {
              final data = response as Error;
              return Center(
                child: Text('Error: ${data.error}'),
              );
            }
            final desafiosList = response as Success<List<Desafios>>;
            return GridView.builder(
                itemCount: desafiosList.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.9,
                    // crossAxisSpacing: 1.5,
                    mainAxisExtent: 210),
                itemBuilder: (context, index) {
                  final desafio = desafiosList.data[index];
                  return desafiosList.data.isNotEmpty
                      ? DesafiosPageContent(vm, desafio)
                      : const Center(
                          child: Text('No hay elementos'),
                        );
                });
          }),
        ),
        // DesafiosResponse(vm),
        floatingActionButton: const CreateDesafioPage());
  }
}
