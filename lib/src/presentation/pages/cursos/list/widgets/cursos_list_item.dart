import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/cursos.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/list/cursos_list_viewmodel.dart';

class CursoListItem extends StatelessWidget {
  final Cursos curso;
  final CursosListViewModel vm;
  const CursoListItem(this.vm, this.curso, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Image.asset('assets/img/boys.png'),
          //derechos de autor: Illustration by <a href="https://icons8.com/illustrations/author/RogqKjMRAQ79">xopolin</a> from <a href="https://icons8.com/illustrations">Ouch!</a>
        ),
        const SizedBox(height: 30),
        Card(
          color: COLOR_BLACK_LAEL_LIGHT,
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Clase: ${curso.cursoName}',
                    style: const TextStyle(
                        fontFamily: 'DINNextRoundedLTPro',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: COLOR_WHITE),
                  )),
              Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Niveles: ${curso.niveles}',
                    style: const TextStyle(
                        fontFamily: 'DINNextRoundedLTPro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: COLOR_WHITE),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SuzumakukarButton(
                  texto: 'CONTINUAR',
                  onPressed: () {
                    Navigator.pushNamed(context, 'niveles', arguments: curso.id
                        // idCurso.setcursoSeleccionado(curso.id)
                        );
                  },
                  color: COLOR_WHITE,
                  textColor: COLOR_GREEN_PASTEL,
                ),
              ),
              // SuzumakukarDelete(() {
              //   vm.deleteCurso(curso.id);
              // }, COLOR_YELLOW_BEE)
            ],
          ),
        )
      ],
    );
  }
}
