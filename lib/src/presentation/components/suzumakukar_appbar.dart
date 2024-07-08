import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';

class SuzumakukarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Icon? icon;
  final String text;
  final Color colorAppBar;
  final Color textIconColor;
  final Function()? onPressd;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const SuzumakukarAppBar(
      this.icon, this.text, this.textIconColor, this.onPressd, this.colorAppBar,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // DataResultados resultados = Provider.of<DataResultados>(context);
    String font = 'DINNextRoundedLTPro';
    double sizeFont = 20;
    final leadingWidget = icon == null
        ? null
        : IconButton(
            icon: icon!,
            color: textIconColor,
            onPressed: onPressd,
          );
    return AppBar(
      backgroundColor: colorAppBar,
      automaticallyImplyLeading: false,
      leading: leadingWidget,
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
            fontSize: sizeFont,
            fontWeight: FontWeight.bold,
            color: textIconColor,
            fontFamily: font),
      ),
    );
  }
}
