import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';

class SuzumakukarPuntaje extends StatelessWidget {
  final int total;
  final int puntaje;
  final Color themeColor;
  const SuzumakukarPuntaje(this.themeColor, this.total, this.puntaje,
      {super.key});

  @override
  Widget build(BuildContext context) {
    String font = 'Feather Bold';
    Color letterColor = COLOR_BLACK_LAEL;
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 100),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeColor,
        // borderRadius: BorderRadius.circular(15)
      ),
      child: Text(
        'Puntaje $puntaje / $total',
        style: TextStyle(
            color: letterColor,
            fontFamily: font,
            fontWeight: FontWeight.w800,
            fontSize: 15),
      ),
    );
  }
}
