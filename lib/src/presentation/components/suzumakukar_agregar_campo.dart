import 'package:flutter/material.dart';

class SuzumakukarAgregarCampo extends StatelessWidget {
  final Function() onPressed;
  final Color iconColor;
  final String text;
  const SuzumakukarAgregarCampo(this.onPressed, this.iconColor, this.text,
      {super.key});

  @override
  Widget build(BuildContext context) {
    String font = 'DINNextRoundedLTPro';
    return SizedBox(
      child: Column(children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.add_circle_sharp,
              color: iconColor,
            )),
        Text(
          text,
          style: TextStyle(
            fontFamily: font,
          ),
        ),
      ]),
    );
  }
}
