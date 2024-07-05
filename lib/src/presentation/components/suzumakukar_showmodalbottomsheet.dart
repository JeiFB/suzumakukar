import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield.dart';

void showCustomBottomSheet({
  required BuildContext context,
  required String title,
  // final int numberTitle = -1,
  required String font,
  required Color textColor,
  required Color buttonColor,
  bool oneTextField = false,
  Function(int)? onPressedNumber,
  required Function(String)? onPressedTextField,
  required Function(String)? onPressedTextFieldASecond,
  required VoidCallback onPressedButton,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: font,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            onPressedNumber != null
                ? SuzumakukarTextField(
                    label: 'Numero del $title',
                    onChangedNumber: onPressedNumber,
                  )
                : SuzumakukarTextField(
                    label: title,
                    onChanged: onPressedTextField,
                  ),
            const SizedBox(height: 10),
            !oneTextField
                ? SuzumakukarTextField(
                    label: 'Tema del $title',
                    onChanged: onPressedTextFieldASecond,
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            SuzumakukarButton(
              texto: title,
              onPressed: onPressedButton,
              color: buttonColor,
              textColor: textColor,
            ),
          ],
        ),
      );
    },
  );
}
