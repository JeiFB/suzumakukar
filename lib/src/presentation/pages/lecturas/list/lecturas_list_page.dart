import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/list/lecturas_list_response.dart';

class LecturaListPage extends StatelessWidget {
  final bool rol;
  const LecturaListPage(this.rol, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SuzumakukarAppBar(
            null, 'LECTURA', COLOR_WHITE, () => null, COLOR_COFFE_BEAK_INNER),
        body: const LecturaListResponse(),
        floatingActionButton: rol
            ? FloatingActionButton(
                backgroundColor: COLOR_WHITE,
                child: const Icon(
                  Icons.add,
                  color: COLOR_COFFE_BEAK_INNER,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'createlecturapage');
                },
              )
            : null);
  }
}
