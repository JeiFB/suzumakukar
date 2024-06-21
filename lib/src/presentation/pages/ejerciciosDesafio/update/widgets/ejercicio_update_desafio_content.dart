import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/presentation/components/suszumakukar_opcionesrespuesta.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_createejercicio.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/update/ejercicio_update_desafio_viewmodel.dart';

class EjercicioUpdateDesafioContent extends StatelessWidget {
  final EjercicioUpdateDesafioViewModel vm;
  final String idDesafio;
  final EjerciciosMultiple ejercicios;
  const EjercicioUpdateDesafioContent(this.vm, this.idDesafio, this.ejercicios,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Color boton = COLOR_BLUE_MACAW;
    Color textBoton = COLOR_WHITE;
    return ListView(
      children: [
        SuzumakukarCreateEjercicio(
            initialEjercicio: ejercicios.ejercicio,
            initialPlanteamiento: ejercicios.descripcion,
            initialRespuesta: ejercicios.opciones[0],
            respuesta: 'Respuesta',
            onChangeEjercicio: (value) {
              vm.changeEjercicio(value);
            },
            onChangeDescripcion: (value) {
              vm.changeDescripcion(value);
            },
            onChangeRespuesta: (value) {
              vm.changeRespuesta(value);
              vm.changeOpcion(value, index: 0);
            }),
        Column(
          children: [
            SuzumakukarOpcionesRespuesta(
                initialValue: ejercicios.opciones[1], '2', (value) {
              vm.changeOpcion(value, index: 1);
            }),
            SuzumakukarOpcionesRespuesta(
                initialValue: ejercicios.opciones[2], '3', (value) {
              vm.changeOpcion(value, index: 2);
            }),
            SuzumakukarOpcionesRespuesta(
                initialValue: ejercicios.opciones[3], '4', (value) {
              vm.changeOpcion(value, index: 3);
            }),
          ],
        ),
        // const SizedBox(height: 20),
        const SizedBox(height: 15),
        GestureDetector(
            onTap: () {
              vm.pickerImage();
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12)),
                    child: vm.imageFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              vm.imageFile!,
                              fit: BoxFit
                                  .cover, // La imagen cubrirá todo el contenedor
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                        : ejercicios.img != ''
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: NetworkImage(ejercicios.img),
                                  width: double.infinity,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.blue,
                                  ),
                                  Text('Agregar imagen')
                                ],
                              )))),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SuzumakukarButton(
              texto: 'Editar ejercicio',
              onPressed: () {
                vm.updateEjercicio(idDesafio);
              },
              color: boton,
              textColor: textBoton),
        )
      ],
    );
  }
}
