import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_edit_delete_button.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/list/lecturas_list_viewmodel.dart';

class LecturaListContect extends StatelessWidget {
  final LecturaListViewModel vm;
  final Lectura lectura;
  const LecturaListContect(this.vm, this.lectura, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.5),
        child: Column(children: [
          SizedBox(
            child: SuzumakukarEditDeleteButton(
                () {
                  Navigator.pushNamed(context, 'updatelecturapage',
                      arguments: lectura);
                },
                COLOR_BLUE_MACAW,
                () {
                  vm.deleteLectura(lectura.id);
                },
                COLOR_RED_CARDINAL),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              lectura.titulo,
              style: const TextStyle(
                fontFamily: 'Feather Bold',
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: Text(
              lectura.texto,
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'DINNextRoundedLTPro',
                  color: COLOR_BLACK_LAEL),
            ),
          )
        ]),
      ),
    );
  }
}
