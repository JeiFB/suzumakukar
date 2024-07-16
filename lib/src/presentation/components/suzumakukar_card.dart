import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_delete.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/list/desafios_viewmodel.dart';

class SuzumakukarCard extends StatelessWidget {
  final Color themeColor;
  // final String challenge;
  final String challengeNumber;
  final Color textColor;
  final String tema;
  final Function()? onPressedEdit;
  final Color editColor;
  final Function() onPressDelete;
  final Color deleteColor;
  final DesafiosViewModel? vm;
  final String idDesafio;
  const SuzumakukarCard(this.themeColor, this.textColor, this.tema,
      this.onPressedEdit, this.editColor, this.onPressDelete, this.deleteColor,
      {this.challengeNumber = '', this.vm, this.idDesafio = '', super.key});

  @override
  Widget build(BuildContext context) {
    double textSizePrymary = 28;
    double textSizeSecundary = 18;
    String font = 'DINNextRoundedLTPro';
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          color: themeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ListTile(
                      title: Text(
                        challengeNumber.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: textSizePrymary,
                            fontWeight: FontWeight.bold,
                            fontFamily: font,
                            color: textColor),
                      ),
                      subtitle: Text(
                        tema,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: textSizeSecundary,
                            fontFamily: font,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ))),
              SuzumakukarDelete(onPressDelete, deleteColor)
            ],
          )),
    );
  }
}
