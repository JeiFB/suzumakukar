import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/list/lecturas_list_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/list/widgets/lectura_list_content.dart';

class LecturaListResponse extends StatelessWidget {
  const LecturaListResponse({super.key});

  @override
  Widget build(BuildContext context) {
    LecturaListViewModel vm = Provider.of<LecturaListViewModel>(context);
    final controller = PageController(viewportFraction: 0.85);
    return StreamBuilder(
      stream: vm.getLectura(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text('No hay lecturas'),
          );
        }
        final response = snapshot.data;
        if (response is Error) {
          final data = response as Error;
          return Center(
            child: Text('Error: ${data.error}'),
          );
        }
        final lecturaList = response as Success<List<Lectura>>;
        return ListView(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 1.8,
                  color: COLOR_BLACK_LAEL_LIGHT,
                ),
                const SizedBox(height: 15),
                SmoothPageIndicator(
                  controller: controller,
                  count: lecturaList.data.length,
                  effect: const WormEffect(
                      activeDotColor: COLOR_COFFE_BEAK_INNER,
                      dotColor: COLOR_LIGHT_GREY),
                ),
                SizedBox(
                  height: 600,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: lecturaList.data.length,
                    itemBuilder: ((context, index) {
                      return LecturaListContect(vm, lecturaList.data[index]);
                    }),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
