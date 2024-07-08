import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/completedChallenges.dart';

class SuzumakukarPuntajeUser extends StatelessWidget {
  final List<CompletedChallenges> completedChallenges;

  const SuzumakukarPuntajeUser(this.completedChallenges, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: completedChallenges.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Puntajes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Feather Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // color: textColor,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Desafio ${completedChallenges[index].desafioNumber} ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Feather Bold',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Puntaje: ${completedChallenges[index].nota}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Feather Bold',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: COLOR_YELLOW_BEE,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
