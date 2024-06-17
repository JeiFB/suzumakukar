import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/create/create_niveles_page.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/list/niveles_response.dart';

class NivelesPage extends StatelessWidget {
  const NivelesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzumakukarAppBar(
          const Icon(Icons.arrow_back_ios_sharp), 'NIVELES', COLOR_WHITE, () {
        Navigator.pop(context, 'cursos');
      }, COLOR_RED_CARDINAL),
      body: const NivelesResponse(),
      floatingActionButton: const CreateNivelesPage(),
    );
  }
}
