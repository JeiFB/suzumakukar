import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';

class SuzumakukarAlertDialog extends StatelessWidget {
  final Function() onPressedDelete;
  const SuzumakukarAlertDialog(this.onPressedDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Confirmar Eliminación',
        style: TextStyle(
            color: COLOR_BLACK_LAEL,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Feather Bold'),
      ),
      content: const Text(
        '¿Estás seguro que deseas eliminar este elemento?',
        style: TextStyle(
            color: COLOR_BLACK_LAEL,
            fontWeight: FontWeight.bold,
            fontSize: 10,
            fontFamily: 'Feather Bold'),
      ),
      actions: [
        SuzumakukarButton(
            texto: 'Confirmar',
            onPressed: () {
              onPressedDelete();
              Navigator.of(context).pop();
            },
            color: COLOR_BLUE_MACAW,
            textColor: COLOR_WHITE),
        SuzumakukarButton(
            texto: 'Cancelar',
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: COLOR_RED_CARDINAL,
            textColor: COLOR_WHITE),
      ],
    );
  }
}
