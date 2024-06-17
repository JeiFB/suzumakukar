import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/create/create_cursos_page.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/list/cursos_response.dart';

class CursosListPage extends StatelessWidget {
  final bool rol;
  const CursosListPage(this.rol, {super.key});

  @override
  Widget build(BuildContext context) {
    Color textColorAppBar = COLOR_WHITE;
    Color colorAppBar = COLOR_GREEN_PASTEL;

    return Scaffold(
      backgroundColor: COLOR_GREEN_PASTEL,
      appBar:
          SuzumakukarAppBar(null, 'CLASES', textColorAppBar, null, colorAppBar),
      body: const CursosResponse(),
      floatingActionButton: rol ? const CreateCursosPage() : const SizedBox(),
    );
  }
}
