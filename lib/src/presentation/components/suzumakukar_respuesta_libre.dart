import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield.dart';

class SuzumakukarRespuestaLibre extends StatefulWidget {
  final Function(String value) onChange;
  final String respuesta;
  const SuzumakukarRespuestaLibre(
      {required this.onChange, required this.respuesta, super.key});

  @override
  State<SuzumakukarRespuestaLibre> createState() =>
      _SuzumakukarRespuestaLibreState();
}

class _SuzumakukarRespuestaLibreState extends State<SuzumakukarRespuestaLibre> {
  String respuesta = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SuzumakukarTextField(
        onChanged: (value) {
          setState(() {
            widget.onChange(value);
          });
        },
        label: 'Respuesta',
      ),
    );
  }
}
