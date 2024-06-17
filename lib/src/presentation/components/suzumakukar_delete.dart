import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_alert_dialog.dart';

class SuzumakukarDelete extends StatelessWidget {
  final Function() onPressedDelete;
  final Color deleteColor;
  const SuzumakukarDelete(this.onPressedDelete, this.deleteColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SuzumakukarAlertDialog(onPressedDelete);
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: deleteColor,
            )),
      ],
    );
  }
}
