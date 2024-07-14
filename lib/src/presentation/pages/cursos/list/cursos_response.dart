import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/cursos.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/list/cursos_list_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/list/widgets/cursos_list_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CursosResponse extends StatelessWidget {
  const CursosResponse({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.85);
    CursosListViewModel vm = Provider.of<CursosListViewModel>(context);
    return StreamBuilder(
      stream: vm.getCursos(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text('No hay cursos'),
          );
        }
        final response = snapshot.data;
        if (response is Error) {
          final data = response as Error;
          return Center(
            child: Text('Error: ${data.error}'),
          );
        }
        final cursosList = response as Success<List<Cursos>>;
        return ListView(
          children: [
            // Divider(),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 1.8,
                  color: COLOR_BLACK_LAEL_LIGHT,
                ),
                SizedBox(
                  height: 600,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: cursosList.data.length,
                    itemBuilder: ((context, index) {
                      return CursoListItem(vm, cursosList.data[index]);
                    }),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: cursosList.data.length,
                  effect: const WormEffect(
                      activeDotColor: COLOR_WHITE, dotColor: COLOR_LIGHT_GREY),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
