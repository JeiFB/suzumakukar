import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield_multiline.dart';

class SuzumakukarCreateEjercicio extends StatelessWidget {
  final String respuesta;
  final String initialEjercicio;
  final String initialPlanteamiento;
  final String initialRespuesta;
  final Function(String value) onChangeEjercicio;
  final Function(String value) onChangeDescripcion;
  final Function(String value) onChangeRespuesta;
  const SuzumakukarCreateEjercicio(
      {this.initialEjercicio = '',
      this.initialPlanteamiento = '',
      this.initialRespuesta = '',
      this.respuesta = '',
      required this.onChangeEjercicio,
      required this.onChangeDescripcion,
      required this.onChangeRespuesta,
      super.key});

  @override
  Widget build(BuildContext context) {
    String font = 'DINNextRoundedLTPro';
    double fontSize = 18;
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 20);
    double width = double.infinity;
    SizedBox sizedbox = const SizedBox(
      height: 15,
    );
    return Column(
      children: [
        sizedbox,
        Container(
          width: width,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 34, bottom: 15),
          child: Text(
            'Ejercicio: ',
            style: TextStyle(
                fontFamily: font,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: margin,
          child: SuzumakukarTextField(
              initialValue: initialEjercicio,
              label: 'Numero de ejercicio',
              onChanged: onChangeEjercicio),
        ),
        sizedbox,
        Container(
          width: width,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 34, bottom: 15),
          child: Text(
            'Planteamiento: ',
            style: TextStyle(
                fontFamily: font,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: margin,
          child: SuzumakukarTextFieldMuiltiline(
            initialValue: initialPlanteamiento,
            label: 'Planteamiento',
            onChanged: (value) {
              onChangeDescripcion(value);
            },
          ),
        ),
        sizedbox,
        Container(
          width: width,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(
            top: 10,
            left: 34,
            bottom: 5,
          ),
          child: Text(
            '$respuesta: ',
            style: TextStyle(
                fontFamily: font,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: margin,
          child: SuzumakukarTextField(
              initialValue: initialRespuesta,
              label: 'Respuesta',
              onChanged: (value) {
                onChangeRespuesta(value);
              }),
        ),
      ],
    );
  }
}
