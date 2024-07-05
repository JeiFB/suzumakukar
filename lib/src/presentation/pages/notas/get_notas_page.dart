import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/notas/get_notas_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/notas/widgets/get_notas_content.dart';

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
                            return GetNotasContent(
                              // vm,
                              null,
                              user,
                              0,
                            );
                          }
                          final completedChallenges =
                              completedSnapshot.data ?? [];

                          return GetNotasContent(
                            // vm,
                            completedChallenges.isEmpty
                                ? null
                                : completedChallenges[0],
                            user,
                            completedChallenges.length,
                          );
                        },
                      )
                    : const Center(
                        child: Text('No elementos '),
                      );
              });
        }),
      ),
    );
  }
}
