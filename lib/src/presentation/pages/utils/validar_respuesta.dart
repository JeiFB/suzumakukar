List<dynamic> validarRespuesta(int index, List<dynamic> list,
    int totalPreguntas, String respuestCorrecta) {
  final bool continuar = index != totalPreguntas;
  if (continuar) {
  } else {}
  return [];
}

void _handleButtonPrees(String respuestaCorrecta, String respuesta, List<dynamic>list) {
  final bool respuestaValida =
      respuestaCorrecta == respuesta && respuesta.isNotEmpty;
  if (respuestaValida) {
    _handleRespuestaValida(list);
  } else {
    _handleRespuestaInvalida();
  }
}

void _handleRespuestaValida(List<dynamic>list) {

}

void _handleRespuestaInvalida() {}


// Widget _buildButton(BuildContext context, int index, String respuesta,
//     List<dynamic> list, PageController controller, int intentos) {
//   final bool continuar = index != (list.length - 1);
//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 10),
//     child: SuzumakukarButton(
//       color: COLOR_YELLOW_BEE,
//       onPressed: () => _handleButtonPress(
//           context, index, respuesta, continuar, list, controller, intentos),
//       textColor: COLOR_BLACK_LAEL,
//       texto: continuar ? 'Continuar' : 'Finalizar',
//     ),
//   );
// }

// void _handleButtonPress(
//     BuildContext context,
//     int index,
//     String respuesta,
//     bool continuar,
//     List<dynamic> list,
//     PageController controller,
//     int intentos) {
//   final bool respuestaValida =
//       respuesta == list[index].respuesta && respuesta.isNotEmpty;
//   if (respuestaValida) {
//     _handleRespuestaValida(
//         context, index, respuestaValida, respuesta, controller, intentos);
//   } else {
//     _handleRespuestaInvalida();
//   }
// }

// void _handleRespuestaValida(BuildContext context, int index, bool continuar,
//     String respuesta, PageController controller, int intentos) {
//   respuesta = '';
//   controller.nextPage(
//     duration: const Duration(microseconds: 750),
//     curve: Curves.linear,
//   );
//   if (intentos == 0) {
//     setState(() {
//       _updateStateForRespuestaValida(continuar);
//     });
//   } else {
//     setState(() {
//       _updateStateForRespuestaValida(continuar, true);
//     });
//   }
// }


// void _updateStateForRespuestaValida(bool continuar,
//     [bool incrementPuntaje = false]) {
//   sw = false;
//   intentos = 2;
//   modal = false;
//   progreso = (++contador) / widget.ejerciciosList.length;
//   if (incrementPuntaje) {
//     puntaje++;
//   }
// }

// void _handleRespuestaInvalida() {
//   if (respuesta.isNotEmpty) {
//     if (intentos != 0) {
//       --intentos;
//     }
//     if (intentos == 0) {
//       setState(() {
//         modal = true;
//       });
//     } else {
//       setState(() {
//         sw = true;
//       });
//     }
//   }
//   if (!continuar && respuesta.isNotEmpty) {
//     if (intentos != 0) {
//       --intentos;
//     }
//     if (intentos == 0) {
//       setState(() {
//         modal = true;
//       });
//     } else {
//       setState(() {
//         sw = true;
//       });
//     }
//   }
// }
