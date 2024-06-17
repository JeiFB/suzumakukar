import 'package:flutter/material.dart';

class SuzumakukarEdit extends StatelessWidget {
  final Function() onPressedEdit;
  final Color editColor;
  const SuzumakukarEdit(this.onPressedEdit, this.editColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: onPressedEdit,
            icon: Icon(
              Icons.edit,
              color: editColor,
            )),
      ],
    );
  }
}
