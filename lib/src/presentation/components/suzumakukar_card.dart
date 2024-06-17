import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_edit_delete_button.dart';

class SuzumakukarCard extends StatelessWidget {
  final Color themeColor;
  final String title;
  final Color textColor;
  final String tema;
  final Function()? onPressedEdit;
  final Color editColor;
  final Function() onPressDelete;
  final Color deleteColor;
  const SuzumakukarCard(this.themeColor, this.title, this.textColor, this.tema,
      this.onPressedEdit, this.editColor, this.onPressDelete, this.deleteColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double textSizePrymary = 30;
    double textSizeSecundary = 18;
    String font = 'DINNextRoundedLTPro';
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          color: themeColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: textSizePrymary,
                        fontWeight: FontWeight.bold,
                        fontFamily: font,
                        color: textColor),
                  ),
                ),
                Flexible(
                  child: Text(
                    tema,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: textSizeSecundary,
                        fontFamily: font,
                        color: textColor),
                  ),
                ),
                SuzumakukarEditDeleteButton(() => null, COLOR_BLUE_MACAW,
                    onPressDelete, COLOR_YELLOW_BEE)
              ],
            ),
          )),
    );
  }
}
