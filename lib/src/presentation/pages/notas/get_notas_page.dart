import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_puntaje_user.dart';
import 'package:suzumakukar/src/presentation/pages/notas/get_notas_viewmodel.dart';

class GetNotasPage extends StatelessWidget {
  const GetNotasPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetNotasViewmodel vm = Provider.of<GetNotasViewmodel>(context);

    return Scaffold(
        appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new_rounded),
            'Puntajes Desafios', COLOR_WHITE, () {
          Navigator.pop(context);
        }, COLOR_BLUE_MACAW),
        body: StreamBuilder(
          stream: vm.getUsers(),
          builder: ((context, snapshot) {
            final response = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'No hay informacion',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            if (response is Error) {
              final data = response as Error;
              return Center(
                child: Text('Error: ${data.error}'),
              );
            }
            final usersList = response as Success<List<UserData>>;
            return ListView.builder(
                itemCount: usersList.data.length,
                itemBuilder: (context, index) {
                  final user = usersList.data[index];

                  return usersList.data.isNotEmpty
                      ? StreamBuilder(
                          stream: vm.completedChallenges(user.id),
                          builder: (context, completedSnapshot) {
                            if (completedSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (!completedSnapshot.hasData) {
                              return Text('Sin datos');
                            }
                            final completedChallenges =
                                completedSnapshot.data ?? [];

                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return completedChallenges.isNotEmpty
                                          ? SuzumakukarPuntajeUser(
                                              completedChallenges)
                                          : const Center(
                                              child: Text(
                                                'Sin Realizar Desafios',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Feather Bold',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: COLOR_YELLOW_BEE,
                                                ),
                                              ),
                                            );
                                    });
                              },
                              child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 2,
                                  color: COLOR_BLUE_MACAW,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(children: [
                                      CircleAvatar(
                                        backgroundImage: user.img != ""
                                            ? NetworkImage(user.img)
                                            : null,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              user.name,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: COLOR_WHITE,
                                                fontSize: 20,
                                                fontFamily: 'Feather Bold',
                                              ),
                                            ),
                                            Text(
                                              'Desafios realizados: ${completedChallenges.length}',
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: COLOR_YELLOW_BEE,
                                                fontFamily: 'Feather Bold',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  )),
                            );
                            //       GetNotasContent(
                            //         // vm,
                            //         completedChallenges.isEmpty
                            //             ? null
                            //             : completedChallenges ,
                            //         user,
                            //         completedChallenges.length,
                            //       );
                            //     },
                            //   )
                            // : const Center(
                            //     child: Text('No elementos '),
                            //   );
                          })
                      : SizedBox();
                });
          }),
        ));
  }
}
