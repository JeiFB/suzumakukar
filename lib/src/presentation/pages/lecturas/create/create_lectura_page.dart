import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_response.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/widgets/create_lectura_content.dart';

class CreateLecturaPage extends StatelessWidget {
  const CreateLecturaPage({super.key});

  @override
  Widget build(BuildContext context) {
    CreateLecturaViewModel vm = Provider.of<CreateLecturaViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CreateLecturaResponse(vm, context);
    });
    return Scaffold(
      appBar: SuzumakukarAppBar(
          const Icon(Icons.arrow_back_ios_new), 'Crear lectura', COLOR_WHITE,
          () {
        Navigator.pop(context);
      }, COLOR_COFFE_BEAK_INNER),
      body: CreateLecturaContent(vm),
    );
  }
}
