import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield.dart';

class SuzumakukarOpcionesRespuesta extends StatelessWidget {
  final String opcion;
  final String initialValue;
  final Function(String value) onChangeOpcion;
  const SuzumakukarOpcionesRespuesta(this.opcion, this.onChangeOpcion,
      {this.initialValue = '', super.key});

  @override
  Widget build(BuildContext context) {
    String font = 'DINNextRoundedLTPro';
    double fontSize = 18;
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(
            top: 10,
            left: 34,
            bottom: 5,
          ),
          child: Text(
            'Opción $opcion:',
            style: TextStyle(
                fontFamily: font,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SuzumakukarTextField(
              initialValue: initialValue,
              label: 'Opción $opcion',
              onChanged: onChangeOpcion),
        ),
      ],
    );
  }
}
