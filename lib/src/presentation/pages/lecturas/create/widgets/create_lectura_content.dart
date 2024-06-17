import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield_multiline.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_viewmodel.dart';

class CreateLecturaContent extends StatelessWidget {
  final CreateLecturaViewModel vm;
  const CreateLecturaContent(this.vm, {super.key});

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
                  vm.createLectura();
                },
                textColor: COLOR_WHITE,
                texto: 'Agregar lectura'),
          )
        ],
      ),
    );
  }
}
