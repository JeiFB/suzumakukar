import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';

class GetNotasContent extends StatelessWidget {
  // final GetNotasViewmodel vm;
  final int total;
  final CompletedChallenges? challenges;
  final UserData user;
  const GetNotasContent(
      // this.vm,
      this.challenges,
      this.user,
      this.total,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
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
                            'Desafio ${challenges?.desafioNumber ?? 'Sin realizar'} ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Feather Bold',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Puntaje: ${challenges?.nota ?? 0}',
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
              },
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            color: COLOR_BLUE_MACAW,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        user.img != "" ? NetworkImage(user.img) : null,
                    radius: 30,
                    child: user.img == ""
                        ? const Icon(
                            Icons.person,
                            size: 30,
                          )
                        : null,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            // fontSize: 8,
                            color: COLOR_WHITE,
                            fontSize: 20,
                            fontFamily: 'Feather Bold',
                          ),
                        ),
                        // const Flexible(
                        //   child:
                        Text(
                          'Desafios realizados: $total',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: COLOR_YELLOW_BEE,
                            fontFamily: 'Feather Bold',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
