import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_agregar_campo.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_createejercicio.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_delete.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield_multiline.dart';

import 'package:suzumakukar/src/presentation/pages/ejercicios/update/ejercicio_update_viewmodel.dart';

class EjercicioUpdateContent extends StatefulWidget {
  final String idCurso;
  final String idNivel;
  final EjercicioUpdateViewModel vm;
  final Ejercicios ejercicios;
  const EjercicioUpdateContent(
      this.idCurso, this.idNivel, this.vm, this.ejercicios,
      {super.key});

  @override
  State<EjercicioUpdateContent> createState() => _EjercicioUpdateContentState();
}

class _EjercicioUpdateContentState extends State<EjercicioUpdateContent> {
  late List<String> camposAdicionales;
  @override
  void initState() {
    super.initState();
    camposAdicionales = List<String>.from(widget.ejercicios.ejecucion);
  }

  void agregarCampo() {
    if (!camposAdicionales.contains('')) {
      camposAdicionales.add('');
    }
  }

  void eliminarCampo(int index) {
    camposAdicionales.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    Color deleteColor = COLOR_RED_CARDINAL;
    Color iconColorAgregar = COLOR_BLUE_MACAW;
    String font = 'DINNextRoundedLTPro';
    double fontSize = 18;
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            SuzumakukarCreateEjercicio(
                initialEjercicio: widget.ejercicios.ejercicio.toString(),
                initialPlanteamiento: widget.ejercicios.descripcion,
                initialRespuesta: widget.ejercicios.respuesta,
                respuesta: 'Respuesta',
                onChangeEjercicio: (value) {
                  widget.vm.changeEjercicio(value);
                },
                onChangeDescripcion: (value) {
                  widget.vm.changeDescripcion(value);
                },
                onChangeRespuesta: (value) {
                  widget.vm.changeRespuesta(value);
                }),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 34),
              child: Text(
                'Ejecución: ',
                style: TextStyle(
                    fontFamily: font,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                for (var i = 0; i < camposAdicionales.length; i++)
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, top: 20),
                          child: SuzumakukarTextFieldMuiltiline(
                              initialValue:
                                  i < widget.ejercicios.ejecucion.length
                                      ? widget.ejercicios.ejecucion[i]
                                      : '',
                              label: 'Agregar texto',
                              onChanged: (value) {
                                camposAdicionales[i] = value;
                              }),
                        ),
                      ),
                      SuzumakukarDelete(() {
                        setState(() {
                          camposAdicionales.removeAt(i);
                        });
                      }, deleteColor)
                    ],
                  ),
                SuzumakukarAgregarCampo(() {
                  setState(() {
                    agregarCampo();
                  });
                }, iconColorAgregar, 'Agregar campo')
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SuzumakukarButton(
                  texto: 'Editar ejercicio',
                  onPressed: () {
                    widget.vm.changeEjecucion(camposAdicionales);
                    widget.vm.updateEjercicio(widget.idCurso, widget.idNivel);
                  },
                  color: COLOR_BLUE_MACAW,
                  textColor: COLOR_WHITE),
            ),
          ],
        )
      ],
    );
  }
}
