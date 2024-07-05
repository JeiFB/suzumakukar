import 'package:flutter/material.dart';

class SuzumakukarRespuestaOpciones extends StatefulWidget {
  final String respuesta;
  final List<dynamic> ejerciciosList;
  final int index;
  final Color radioActiveColor;
  final Function(String nuevaRespuesta) onRespuestaChanged;
  // final Function(dynamic value, String opcion) onChange;
  const SuzumakukarRespuestaOpciones(
      {required this.respuesta,
      required this.ejerciciosList,
      required this.index,
      required this.radioActiveColor,
      required this.onRespuestaChanged,
      super.key});

  @override
  State<SuzumakukarRespuestaOpciones> createState() =>
      _SuzumakukarRespuestaOpcionesState();
}

class _SuzumakukarRespuestaOpcionesState
    extends State<SuzumakukarRespuestaOpciones> {
  late List<List<dynamic>> opcionesAleatorias;
  String selectedOption = '';
  bool sw = true;
  @override
  void initState() {
    super.initState();

    actualizarOpcionesAleatorias();
  }

  @override
  void didUpdateWidget(SuzumakukarRespuestaOpciones oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.ejerciciosList != widget.ejerciciosList) {
      // print('aleatorio');
      actualizarOpcionesAleatorias();
    }
  }

  void actualizarOpcionesAleatorias() {
    setState(() {
      opcionesAleatorias = widget.ejerciciosList
          .map((ejercicio) => List.from(ejercicio.opciones)..shuffle())
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    Color? radioActiveColor = widget.radioActiveColor;
    String fontPrimary = 'Feather Bold';

    return Column(
      children: opcionesAleatorias[index].map((opcion) {
        return RadioListTile(
          title: Text(opcion.toString(),
              style: TextStyle(
                  fontFamily: fontPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.normal)),
          value: opcion,
          groupValue: widget.respuesta,
          onChanged: (value) {
            setState(() {
              widget.onRespuestaChanged(value);
            });
          },
          activeColor: radioActiveColor,
        );
      }).toList(),
    );
  }
}
