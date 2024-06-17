import 'package:flutter/material.dart';

class SuzumakukarButton extends StatelessWidget {
  final String texto;
  final Function() onPressed;
  final Color color;
  final Color textColor;

  const SuzumakukarButton(
      {super.key,
      required this.texto,
      required this.onPressed,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Text(
            texto,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Feather Bold'),
          )),
    );
  }
}
