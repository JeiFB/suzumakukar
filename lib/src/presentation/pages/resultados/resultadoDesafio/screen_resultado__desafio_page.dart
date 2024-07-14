import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadoDesafio/screen_resultado__desafio_response.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadoDesafio/screen_resultado__desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadoDesafio/widgets/screen_resultado__desafio_content.dart';

class ScreenResultadoDesafioPage extends StatelessWidget {
  const ScreenResultadoDesafioPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenResultadoDesafioViewModel vm =
        Provider.of<ScreenResultadoDesafioViewModel>(context);
    final Map argurmets = ModalRoute.of(context)?.settings.arguments as Map;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScreenResultadoDesafioResponse(context, vm);
    });
    return Scaffold(
      body: ScreenResultadoDesafioContent(vm, argurmets),
    );
  }
}
