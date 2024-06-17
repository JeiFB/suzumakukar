import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';

class ScreenContent extends StatelessWidget {
  const ScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Align(
        child: Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Text(
              'SUZUMAKUKAR',
              style: TextStyle(
                  color: COLOR_GREEN, fontFamily: 'Feather Bold', fontSize: 30),
            )),
      )),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SuzumakukarButton(
              textColor: COLOR_WHITE,
              texto: 'INICIAR SESION',
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              color: COLOR_GREEN,
            ),
            SuzumakukarButton(
              textColor: COLOR_WHITE,
              texto: 'REGISTRARSE',
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              color: COLOR_GREEN,
            )
          ],
        ),
      )
    ]);
  }
}
