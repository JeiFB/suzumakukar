import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suszumakukar_opcionesrespuesta.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_createejercicio.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/create/create_ejercicio_desafio_viewmodel.dart';

class CreateEjercicioContent extends StatelessWidget {
  final CreateEjercicioDesafioViewModel vm;
  final String idDesafio;
  const CreateEjercicioContent(this.vm, this.idDesafio, {super.key});

  @override
  Widget build(BuildContext context) {
    Color boton = COLOR_BLUE_MACAW;
    Color textBoton = COLOR_WHITE;
    return ListView(
      children: [
        SuzumakukarCreateEjercicio(
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
            SuzumakukarOpcionesRespuesta('2', (value) {
              vm.changeOpcion(value, index: 1);
            }),
            SuzumakukarOpcionesRespuesta('3', (value) {
              vm.changeOpcion(value, index: 2);
            }),
            SuzumakukarOpcionesRespuesta('4', (value) {
              vm.changeOpcion(value, index: 3);
            }),
          ],
        ),
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
                      ),
              ),
            )),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SuzumakukarButton(
              texto: 'Agregar',
              onPressed: () {
                vm.createEjercicio(idDesafio);
              },
              color: boton,
              textColor: textBoton),
        )
      ],
    );
  }
}
