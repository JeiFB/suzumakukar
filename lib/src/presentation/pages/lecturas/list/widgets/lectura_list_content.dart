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
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
          SizedBox(
            child:
                SuzumakukarEditDeleteButton(() => null, COLOR_BLUE_MACAW, () {
              vm.deleteLectura(lectura.id);
            }, COLOR_RED_CARDINAL),
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
                  color: COLOR_GREY),
            ),
          )
        ]),
      ),
    );
  }
}



// String text = 'En el vasto tejido de la vida cotidiana, las operaciones'
    //     'matemáticas desempeñan un papel esencial, siendo el'
    //     'lenguaje universal que nos conecta con la estructura'
    //     'intrínseca del mundo que nos rodea. La suma, resta,'
    //     'multiplicación y división son las herramientas'
    //     'fundamentales que nos permiten resolver situaciones'
    //     'desde las más simples hasta las ciencias más'
    //     ' complejas. \n\n'
    //     'Las fracciones, números decimales y porcentajes, a'
    //     'menudo percibidos como conceptos abstractos, se revelan como pilares esenciales de'
    //     'nuestra existencia diaria. Las fracciones nos ayudan a dividir y compartir, desde repartir'
    //     'una pizza entre amigos hasta calcular porcentajes de descuento en las compras'
    //     ' cotidianas.\n\n'
    //     'Los números decimales, presentes en'
    //     'precios, medidas y finanzas personales,'
    //     'nos brindan precisión y claridad en'
    //     'nuestras transacciones diarias.'
    //     'Comprender cómo se utilizan en la vida'
    //     'cotidiana nos empodera en un mundo'
    //     'cada vez más digitalizado.\n\n'
    //     'Los porcentajes, omnipresentes en'
    //     'descuentos, impuestos y evaluaciones,'
    //     'son la clave para interpretar y negociar con eficacia en el'
    //     'complejo entramado de la sociedad moderna. Ser'
    //     'competente en estos conceptos no solo es una habilidad,'
    //     'sino una necesidad para desenvolverse con éxito en la'
    //     'sociedad del conocimiento, donde la destreza matemática'
    //     'es la llave que desbloquea oportunidades y facilita la toma'
    //     'de decisiones informadas. Así, en el tejido matemático de la'
    //     'vida diaria, encontramos la esencia de la competencia y la'
    //     'comprensión en nuestra travesía cotidiana.';