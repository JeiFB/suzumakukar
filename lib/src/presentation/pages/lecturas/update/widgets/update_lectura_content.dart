import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield_multiline.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/update/update_lectura_viewmodel.dart';

class UpdateLecturaContent extends StatelessWidget {
  final UpdateLecturaViewModel vm;
  final Lectura lectura;
  const UpdateLecturaContent(this.vm, this.lectura, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: SuzumakukarTextField(
              label: 'Titulo',
              initialValue: lectura.titulo,
              onChanged: (value) {
                vm.changeTitulo(value);
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: SuzumakukarTextFieldMuiltiline(
              label: 'Texto',
              initialValue: lectura.texto,
              onChanged: (value) {
                vm.changeTexto(value);
              },
              maxline: 10,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: SuzumakukarButton(
                color: COLOR_COFFE_BEAK_INNER,
                onPressed: () {
                  vm.updateLectura();
                },
                textColor: COLOR_WHITE,
                texto: 'Editar lectura'),
          )
        ],
      ),
    );
  }
}
