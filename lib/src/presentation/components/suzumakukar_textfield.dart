import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:suzumakukar/src/colors/base_color.dart';

class SuzumakukarTextField extends StatefulWidget {
  final String label;
  // final IconData icon;
  final bool obscureText;
  final bool showIcon;
  final bool error;
  final String initialValue;
  final String errorText;
  final bool noEspacios;
  final Function(int value)? onChangedNumber;
  final Function(String text)? onChanged;

  const SuzumakukarTextField(
      {Key? key,
      required this.label,
      // required this.icon,
      this.onChangedNumber,
      this.onChanged,
      this.initialValue = '',
      this.obscureText = false,
      this.showIcon = false,
      this.error = false,
      this.noEspacios = true,
      this.errorText = ''})
      : super(key: key);

  @override
  createState() => _SuzumakukarTextFieldState();
}

// Movemos _DefaultTextFieldState dentro de DefaultTextField
class _SuzumakukarTextFieldState extends State<SuzumakukarTextField> {
  bool _isPasswordObscure = true;

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _usernameController,
      initialValue: widget.initialValue,
      inputFormatters: widget.noEspacios
          ? null
          : [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
      keyboardType:
          widget.onChangedNumber != null ? TextInputType.number : null,
      onChanged: widget.onChangedNumber != null
          ? (value) {
              final intValue = int.tryParse(value) ?? 0;
              widget.onChangedNumber!(intValue);
            }
          : widget.onChanged,
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
        errorText: widget.error ? widget.errorText : null,
      ),
      obscureText: widget.obscureText && _isPasswordObscure,
    );
  }
}
