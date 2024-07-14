import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_agregar_campo.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_createejercicio.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_delete.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_textfield_multiline.dart';

import 'package:suzumakukar/src/presentation/pages/ejercicios/create/create_ejercicio_viewmodel.dart';

class CreateEjercicioItem extends StatefulWidget {
  final String idCurso;
  final String idNivel;
  final CreateEjercicioViewModel vm;
  const CreateEjercicioItem(this.idCurso, this.idNivel, this.vm, {super.key});

  @override
  State<CreateEjercicioItem> createState() => _CreateEjercicioItemState();
}

class _CreateEjercicioItemState extends State<CreateEjercicioItem> {
  List<String> camposAdicionales = [];

  void agregarCampo() {
    camposAdicionales.add('');
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
                respuesta: 'Respuesta',
                onChangeEjercicio: (value) {
                  widget.vm.changeEjercicio(value);
                },
                onChangeDescripcion: (value) {
                  widget.vm.changeDescripcion(value);
                },
                onChangeRespuesta: (value) =>
                    {widget.vm.changeRespuesta(value)}),
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
                  texto: 'Agregar ejercicio',
                  onPressed: () {
                    widget.vm.changeEjecucion(camposAdicionales);
                    widget.vm.createEjercicio(widget.idCurso, widget.idNivel);
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
