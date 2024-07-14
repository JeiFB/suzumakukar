import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_pageview_builder.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_progressbar.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_puntaje.dart';
import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';

class SuzumakukarEjerciciosContent extends StatelessWidget {
  final Function() editReset;
  final Function() delete;
  final String paginaDestino;
  final List<dynamic> ejerciciosList;
  final bool multipleOpcion;
  final bool mostrarEjecucion;
  final Color showColor;
  final Color themeColor;
  final String idCurso;
  final String id;
  final int numberDesafio;
  const SuzumakukarEjerciciosContent(
      this.paginaDestino,
      this.editReset,
      this.delete,
      this.showColor,
      this.themeColor,
      this.ejerciciosList,
      this.multipleOpcion,
      this.mostrarEjecucion,
      this.id,
      this.idCurso,
      {required this.numberDesafio,
      super.key});

  @override
  Widget build(BuildContext context) {
    Color shadowColor = showColor;
    DataResultados resultados = Provider.of<DataResultados>(context);
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 1.8,
          color: shadowColor,
        ),
        SuzumakukarPuntaje(
            themeColor, ejerciciosList.length, resultados.puntaje),
        const SizedBox(
          height: 15,
        ),
        SuzumakukarProgressBar(themeColor, resultados.progreso),
        const SizedBox(height: 10),
        SizedBox(
          height: 790,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: SuzumakukarPageViewBuilder(
              paginaDestino,
              editReset,
              delete,
              themeColor,
              ejerciciosList,
              multipleOpcion,
              mostrarEjecucion,
              id: id,
              idCurso: idCurso,
              numberDesafio: numberDesafio,
            ),
          ),
        ),
      ],
    );
  }
}
