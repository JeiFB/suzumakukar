import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';

class SuzumakukarTextFieldMuiltiline extends StatefulWidget {
  final String label;
  // final IconData icon;
  final bool obscureText;
  final bool showIcon;
  final bool error;
  final String initialValue;
  final String errorText;
  final int maxline;
  final Function(String text) onChanged;
  const SuzumakukarTextFieldMuiltiline(
      {Key? key,
      required this.label,
      // required this.icon,
      required this.onChanged,
      this.maxline = 2,
      this.initialValue = '',
      this.obscureText = false,
      this.showIcon = false,
      this.error = false,
      this.errorText = ''})
      : super(key: key);

  @override
  State<SuzumakukarTextFieldMuiltiline> createState() =>
      _SuzumakukarTextFieldMuiltilineState();
}

class _SuzumakukarTextFieldMuiltilineState
    extends State<SuzumakukarTextFieldMuiltiline> {
  bool _isPasswordObscure = true;

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: TextInputType.multiline,
      maxLines: widget.maxline,
      onChanged: widget.onChanged,
      cursorColor: COLOR_BLUE_MACAW,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: COLOR_GREY,
          fontFamily: 'Feather Bold',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        fillColor: COLOR_LIGHT_GREY,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 5.5, color: COLOR_LIGHT_GREY),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1.5, color: COLOR_GREY),
        ),
        suffixIcon: widget.showIcon
            ? IconButton(
                icon: Icon(
                  _isPasswordObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: COLOR_BLUE_MACAW,
                  size: 30,
                ),
                focusColor: COLOR_BLUE_MACAW,
                onPressed: togglePasswordVisibility,
              )
            : null,
        // errorText: widget.error ? widget.errorText : '',
      ),
      obscureText: widget.obscureText && _isPasswordObscure,
    );
  }
}
