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
  final String idCurso;
  final String id;
  final int numberDesafio;
  const SuzumakukarPageViewBuilder(
    this.paginaDestino,
    this.editReset,
    this.delete,
    this.themeColor,
    this.ejerciciosList,
    this.multipleOpcion,
    this.mostrarEjecucion, {
    this.id = '',
    this.idCurso = '',
    required this.numberDesafio,
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
                              'Ejercicio ${widget.ejerciciosList[index].ejercicio}',
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
                          widget.ejerciciosList[index].img != ''
                              ? Container(
                                  height: 260,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                      image: NetworkImage(
                                          widget.ejerciciosList[index].img),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
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
                                id: widget.id,
                                numberDesafio: widget.numberDesafio,
                                lista: widget.ejerciciosList,
                              ),
                              SuzumakukarEditDeleteButton(
                                  () {
                                    widget.editReset();
                                    Navigator.pushNamed(
                                        context, widget.paginaDestino,
                                        arguments: {
                                          "idCurso": widget.idCurso,
                                          "id": widget.id,
                                          "lista": widget.ejerciciosList[index]
                                        });
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
