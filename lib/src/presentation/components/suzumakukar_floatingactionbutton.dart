import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_showmodalbottomsheet.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class SuzumakukarFloatingActionButton extends StatelessWidget {
  final Color colorButton;
  final Color colorIcon;
  final String title;
  // final int numberTitle;
  final bool oneTextField;
  final Function(int value)? onPressedNumber;
  final Function(String value)? onPressedTextField;
  final Function(String value) onPressedTextFieldASecond;
  final Function() onPressedButton;
  const SuzumakukarFloatingActionButton(
      this.colorButton,
      this.oneTextField,
      this.colorIcon,
      this.title,
      this.onPressedNumber,
      this.onPressedTextField,
      this.onPressedTextFieldASecond,
      this.onPressedButton,
      {
      // this.numberTitle = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    Color bgColor = COLOR_WHITE;
    Color textColor = COLOR_BLACK_LAEL;
    String font = 'DINNextRoundedLTPro';

    RolUser rolUser = Provider.of<RolUser>(context);

    return rolUser.rolUser
        ? FloatingActionButton(
            backgroundColor: bgColor,
            child: Icon(
              Icons.add,
              color: colorIcon,
            ),
            onPressed: () {
              showCustomBottomSheet(
                oneTextField: oneTextField,
                context: context,
                title: title,
                font: 'Feather Bold',
                textColor: textColor,
                buttonColor: colorButton,
                onPressedNumber: onPressedNumber,
                onPressedTextField: onPressedTextField,
                onPressedTextFieldASecond: onPressedTextFieldASecond,
                onPressedButton: onPressedButton,
              );
            })
        : const SizedBox();
  }
}
