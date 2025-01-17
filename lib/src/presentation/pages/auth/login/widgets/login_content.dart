import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield.dart';
import 'package:suzumakukar/src/presentation/pages/auth/login/login_viewmodel.dart';

class LoginContent extends StatelessWidget {
  final LoginViewModel vm;
  const LoginContent(this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    Color color = COLOR_BLUE_MACAW;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SuzumakukarTextField(
            onChanged: (value) {
              vm.changeUserName(value);
            },
            noEspacios: false,
            label: 'Nombre de usuario'),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: SuzumakukarTextField(
            onChanged: (value) {
              vm.changePassword(value);
            },
            obscureText: true,
            showIcon: true,
            label: 'Contraseña'),
      ),
      Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: SuzumakukarButton(
            textColor: COLOR_WHITE,
            texto: 'INGRESAR',
            onPressed: () {
              vm.login();
            },
            color: color,
          )),
    ]);
  }
}
