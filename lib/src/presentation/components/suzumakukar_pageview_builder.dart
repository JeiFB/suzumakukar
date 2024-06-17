import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_edit_delete_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_response.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_ejercicio.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class SuzumakukarPageViewBuilder extends StatefulWidget {
  final Function() editReset;
  final Function() delete;
  final String paginaDestino;
  final List<dynamic> ejerciciosList;
  final bool multipleOpcion;
  final bool mostrarEjecucion;
  final Color themeColor;
  const SuzumakukarPageViewBuilder(
    this.paginaDestino,
    this.editReset,
    this.delete,
    this.themeColor,
    this.ejerciciosList,
    this.multipleOpcion,
    this.mostrarEjecucion, {
    super.key,
  });

  @override
  State<SuzumakukarPageViewBuilder> createState() =>
      _SuzumakukarPageViewBuilderState();
}

class _SuzumakukarPageViewBuilderState
    extends State<SuzumakukarPageViewBuilder> {
  final PageController _controller = PageController(initialPage: 0);
  String respuesta = '';

  // late List<List<dynamic>> opcionesAleatorias;
  // @override
  // void initState() {
  //   super.initState();
  //   actualizarOpcionesAleatorias();
  // }

  // @override
  // void didUpdateWidget(SuzumakukarPageViewBuilder oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.ejerciciosList != oldWidget.ejerciciosList) {
  //     actualizarOpcionesAleatorias();
  //   }
  // }

  // void actualizarOpcionesAleatorias() {
  //   setState(() {
  //     opcionesAleatorias = widget.ejerciciosList
  //         .map((ejercicio) => List.from(ejercicio.opciones)..shuffle())
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Color cardColor = COLOR_WHITE;
    Color letterColor = COLOR_BLACK_LAEL;
    String fontPrimary = 'Feather Bold';
    RolUser rolUser = Provider.of<RolUser>(context);
    ObtenerIdEjercicio idEjercicio = Provider.of<ObtenerIdEjercicio>(context);
    return PageView.builder(
      physics: !rolUser.rolUser ? const NeverScrollableScrollPhysics() : null,
      controller: _controller,
      itemCount: widget.ejerciciosList.length,
      itemBuilder: (context, index) {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Card(
              color: cardColor,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Ejercicio ${index + 1}',
                              style: TextStyle(
                                  color: widget.themeColor,
                                  fontFamily: fontPrimary,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              widget.ejerciciosList[index].descripcion,
                              style: TextStyle(
                                  color: letterColor,
                                  fontFamily: fontPrimary,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SuzumakukarResponse(
                                themeColor: widget.themeColor,
                                multipleOpcion: widget.multipleOpcion,
                                index: index,
                                mostrarEjecucion: widget.mostrarEjecucion,
                                totalPreguntas: widget.ejerciciosList.length,
                                controller: _controller,
                                lista: widget.ejerciciosList,
                              ),
                              SuzumakukarEditDeleteButton(
                                  () {
                                    widget.editReset();
                                    Navigator.pushNamed(
                                        context, widget.paginaDestino,
                                        arguments:
                                            widget.ejerciciosList[index]);
                                  },
                                  COLOR_BLACK_LAEL,
                                  () {
                                    idEjercicio.setEjercicioSeleccionado(
                                        widget.ejerciciosList[index].id);
                                    widget.delete();
                                  },
                                  COLOR_BLACK_LAEL)
                            ],
                          ),
                        ],
                      ),
                    ]),
              ))
        ]);
      },
    );
  }
}
