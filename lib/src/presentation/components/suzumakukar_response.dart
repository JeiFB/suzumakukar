import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button_ejecucion.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_respuesta_libre.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_respuesta_opciones.dart';
import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';

class SuzumakukarResponse extends StatefulWidget {
  final Color themeColor;
  final bool multipleOpcion;
  final int index;
  final int totalPreguntas;
  final PageController controller;
  final List<dynamic> lista;
  final bool mostrarEjecucion;
  const SuzumakukarResponse(
      {this.themeColor = Colors.blue,
      this.multipleOpcion = false,
      this.mostrarEjecucion = false,
      required this.index,
      required this.totalPreguntas,
      required this.controller,
      required this.lista,
      super.key});

  @override
  State<SuzumakukarResponse> createState() => _SuzumakukarResponseState();
}

class _SuzumakukarResponseState extends State<SuzumakukarResponse> {
  String respuesta = '';
  bool modal = false;
  double progreso = 0;
  int contador = 0;
  bool sw = false;
  int intentos = 2;
  int puntaje = 0;

  @override
  Widget build(BuildContext context) {
    Color warningColor = COLOR_RED_CARDINAL;
    String fontPrimary = 'Feather Bold';
    DataResultados resultados = Provider.of<DataResultados>(context);

    return Column(children: [
      sw
          ? SizedBox(
              height: 30,
              child: Text(
                'Intentos restantes $intentos',
                style: TextStyle(
                    color: warningColor,
                    fontFamily: fontPrimary,
                    fontWeight: FontWeight.w900,
                    fontSize: 15),
              ),
            )
          : const SizedBox(height: 30),
      widget.multipleOpcion
          ? SuzumakukarRespuestaOpciones(
              respuesta: respuesta,
              ejerciciosList: widget.lista,
              index: widget.index,
              radioActiveColor: COLOR_PURPLE,
              onRespuestaChanged: (nuevaRespuesta) {
                setState(() {
                  respuesta = nuevaRespuesta;
                });
              })
          : SuzumakukarRespuestaLibre(
              onChange: (nuevaRespuesta) {
                setState(() {
                  respuesta = nuevaRespuesta;
                });
              },
              respuesta: respuesta),
      // ),
      const SizedBox(
        height: 10,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SuzumakukarButton(
          color: widget.themeColor,
          onPressed: () {
            resultados.newTotalPreguntas(widget.totalPreguntas);
            if ((respuesta == widget.lista[widget.index].respuesta) &&
                respuesta.isNotEmpty) {
              setState(() {
                respuesta = '';
                sw = false;
                (intentos != 0) ? resultados.newPuntaje(1) : '';
                intentos = 2;
                modal = false;
                progreso = (++contador) / widget.totalPreguntas;
                resultados.newProgreso(progreso);
              });
              (widget.index != (widget.totalPreguntas - 1))
                  ? widget.controller.nextPage(
                      duration: const Duration(microseconds: 750),
                      curve: Curves.linear,
                    )
                  : widget.multipleOpcion
                      ? Navigator.popAndPushNamed(
                          context, 'screenresultadodesafiopage')
                      : Navigator.popAndPushNamed(
                          context, 'screenresultadopage');
            } else {
              if (respuesta.isNotEmpty) {
                if (intentos != 0) {
                  --intentos;
                }
                if (intentos == 0) {
                  widget.mostrarEjecucion
                      ? setState(() {
                          modal = true;
                        })
                      : (widget.index != (widget.totalPreguntas - 1))
                          ? widget.controller.nextPage(
                              duration: const Duration(microseconds: 750),
                              curve: Curves.linear,
                            )
                          : widget.multipleOpcion
                              ? Navigator.popAndPushNamed(
                                  context, 'screenresultadodesafiopage')
                              : Navigator.popAndPushNamed(
                                  context, 'screenresultadopage');
                } else {
                  setState(() {
                    sw = true;
                  });
                }
              }
            }
          },
          textColor: COLOR_BLACK_LAEL,
          texto: widget.index != (widget.totalPreguntas - 1)
              ? 'Continuar'
              : 'Finalizar',
        ),
      ),
      (widget.mostrarEjecucion && modal)
          ? SuzumakukarButtonEjecucion(widget.index, widget.lista)
          : const SizedBox(height: 15),
    ]);
  }
}
