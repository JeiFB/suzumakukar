import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';

class SuzumakukarProgressBar extends StatelessWidget {
  final double progreso;
  final Color themeColor;
  const SuzumakukarProgressBar(this.themeColor, this.progreso, {super.key});

  @override
  Widget build(BuildContext context) {
    String font = 'Feather Bold';
    Color letterColor = COLOR_BLACK_LAEL;
    return Column(
      children: [
        Text(
          'Progreso:',
          style: TextStyle(
              color: letterColor,
              fontFamily: font,
              fontWeight: FontWeight.w900,
              fontSize: 15),
        ),
        SizedBox(
          width: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              color: themeColor,
              value: progreso,
              minHeight: 20,
            ),
          ),
        ),
      ],
    );
  }
}
