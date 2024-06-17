import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';

class SuzumakukarButtonEjecucion extends StatelessWidget {
  final int index;
  final List<dynamic> lista;
  const SuzumakukarButtonEjecucion(this.index, this.lista, {super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = COLOR_YELLOW_BEE;
    Color letterColor = COLOR_BLACK_LAEL;
    Color warningColor = COLOR_RED_CARDINAL;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SuzumakukarButton(
            texto: 'Ejecución',
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: ListView(
                        children: [
                          Text(
                            'Ejecución',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Feather Bold',
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              ...List.generate(lista[index].ejecucion.length,
                                  (stepIndex) {
                                // Obtener el paso actual y el número de paso
                                var paso = lista[index].ejecucion[stepIndex];
                                var numeroPaso = stepIndex + 1;
                                // Construir el texto para el paso actual
                                TextSpan numberPaso = TextSpan(
                                  text: 'Paso $numeroPaso: ',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Feather Bold',
                                    fontWeight: FontWeight.bold,
                                    color: themeColor,
                                  ),
                                );
                                TextSpan pasoText = TextSpan(
                                  text: paso,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Feather Bold',
                                    fontWeight: FontWeight.normal,
                                    color: letterColor,
                                  ),
                                );
                                // 'Paso $numeroPaso: $paso';
                                // Si es el último paso, mostrar "Respuesta" en lugar de "Paso"
                                if (stepIndex ==
                                    lista[index].ejecucion.length - 1) {
                                  numberPaso = TextSpan(
                                    text: 'Respuesta: ',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Feather Bold',
                                      fontWeight: FontWeight.bold,
                                      color: themeColor,
                                    ),
                                  );
                                  pasoText = TextSpan(
                                    text: paso,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Feather Bold',
                                      fontWeight: FontWeight.normal,
                                      color: letterColor,
                                    ),
                                  );
                                }
                                // Mostrar el texto del paso actual
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  width: double.infinity,
                                  child: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Feather Bold',
                                        fontWeight: FontWeight.bold,
                                        color: COLOR_BLACK_LAEL,
                                      ),
                                      children: [numberPaso, pasoText],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
            color: warningColor,
            textColor: letterColor));
  }
}
