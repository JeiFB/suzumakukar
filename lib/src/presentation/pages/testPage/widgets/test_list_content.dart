import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/test.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_card.dart';
import 'package:suzumakukar/src/presentation/pages/testPage/list/test_list_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_test.dart';

class TestListContent extends StatelessWidget {
  final TestListViewModel vm;
  final Test test;
  const TestListContent(this.vm, this.test, {super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = COLOR_PURPLE;
    Color textColor = COLOR_WHITE;
    Color editColor = COLOR_YELLOW_BEE;
    Color deleteColor = COLOR_RED_CARDINAL;
    ObtenerIdTest testId = Provider.of<ObtenerIdTest>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'ejerciciostestpage',
            arguments: testId.setTestSeleccionado(test.id));
      },
      child: SuzumakukarCard(
          themeColor, test.nameTest, textColor, test.tema, null, editColor, () {
        vm.deleteTest(test.id);
      }, deleteColor),
    );
  }
}
