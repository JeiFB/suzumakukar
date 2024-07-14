import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadoDesafio/screen_resultado__desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';

class ScreenResultadoDesafioContent extends StatelessWidget {
  final ScreenResultadoDesafioViewModel vm;
  final Map arguments;
  const ScreenResultadoDesafioContent(this.vm, this.arguments, {super.key});

  @override
  Widget build(BuildContext context) {
    DataResultados resultados = Provider.of<DataResultados>(context);
    return Scaffold(
      backgroundColor: COLOR_MASK_GREEN,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: COLOR_WHITE, // Color más oscuro para el card
            child: SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'RESULTADO',
                      style: TextStyle(
                        color: COLOR_MASK_GREEN,
                        fontSize: 30,
                        fontFamily: 'Feather Bold',
                        // 'Feather Bold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'Feather Bold',
                                fontWeight: FontWeight.bold,
                                color:
                                    COLOR_BLACK_LAEL // Color para el texto completo
                                ),
                            children: [
                          const TextSpan(
                              text: 'Total de preguntas: ', style: TextStyle()),
                          TextSpan(
                            text: '${arguments['totalpreguntas']}',
                            style: const TextStyle(
                              color:
                                  COLOR_MASK_GREEN, // Color específico para '10'
                              fontWeight: FontWeight
                                  .bold, // Puedes aplicar otros estilos aquí
                            ),
                          ),
                        ])),
                    const SizedBox(height: 10),
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'Feather Bold',
                                fontWeight: FontWeight.bold,
                                color:
                                    COLOR_BLACK_LAEL // Color para el texto completo
                                ),
                            children: [
                          const TextSpan(
                              text: 'Correctas: ', style: TextStyle()),
                          TextSpan(
                            text: '${arguments['puntaje']}',
                            style: const TextStyle(
                              color:
                                  COLOR_MASK_GREEN, // Color específico para '10'
                              fontWeight: FontWeight
                                  .bold, // Puedes aplicar otros estilos aquí
                            ),
                          ),
                        ])),
                    const SizedBox(height: 30),
                    SuzumakukarButton(
                        texto: 'Finalizar',
                        onPressed: () {
                          vm.idDesafio(arguments['id']);
                          vm.desafioNumber(arguments['numerodesafio']);
                          vm.notaDesafio(arguments['puntaje'].toString());
                          vm.addResults();
                          resultados.reset();
                          Navigator.pop(context);
                        },
                        color: COLOR_BLUE_MACAW,
                        textColor: COLOR_WHITE)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
