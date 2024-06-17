import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_delete.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_edit.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class SuzumakukarEditDeleteButton extends StatelessWidget {
  final Function() onPressedEdit;
  final Color editColor;
  final Function() onPressedDelete;
  final Color deleteColor;
  const SuzumakukarEditDeleteButton(this.onPressedEdit, this.editColor,
      this.onPressedDelete, this.deleteColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    RolUser rolUser = Provider.of<RolUser>(context);
    if (rolUser.rolUser) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //edit
        SuzumakukarEdit(onPressedEdit, editColor),
        //eliminar
        SuzumakukarDelete(onPressedDelete, deleteColor)
      ]);
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        height: 20,
      );
    }
  }
}
