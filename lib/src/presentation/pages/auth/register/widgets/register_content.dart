import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield.dart';
import 'package:suzumakukar/src/presentation/pages/auth/register/register_viewmodel.dart';

class RegisterContent extends StatelessWidget {
  final RegisterViewmodel vm;
  const RegisterContent(this.vm, {super.key});
  @override
  Widget build(BuildContext context) {
    Color color = COLOR_BLUE_MACAW;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: SuzumakukarTextField(
              label: 'Nombre y Apellido',
              // icon: Icons.person_2_outlined,
              // error: vm.state.username.error,
              onChanged: (value) {
                vm.changeName(value);
              }),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: SuzumakukarTextField(
              label: 'Username',
              noEspacios: false,
              onChanged: (value) {
                vm.changeUserName(value);
              }),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: SuzumakukarTextField(
              label: 'Contraseña',
              obscureText: true,
              showIcon: true,
              onChanged: (value) {
                vm.changePassword(value);
              }),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: SuzumakukarTextField(
              label: 'Confirmar contraseña',
              obscureText: true,
              onChanged: (value) {
                vm.changeConfirmPassword(value);
              }),
        ),
        Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: SuzumakukarButton(
              textColor: COLOR_WHITE,
              texto: 'REGISTRARSE',
              onPressed: () {
                vm.registrarse();
              },
              color: color,
            ))
      ],
    );
  }
}
