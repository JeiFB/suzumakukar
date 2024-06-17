import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/injection.dart';
import 'package:suzumakukar/main.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/pages/profile/info/profile_info_viewmodel.dart';

class ProfileInfoContent extends StatelessWidget {
  // final ProfileInfoViewModel vm;
  final UserData user;
  const ProfileInfoContent(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    ProfileInfoViewModel vm = Provider.of<ProfileInfoViewModel>(context);
    // IdUser idUser = Provider.of<IdUser>(context);
    // idUser.setIdUser(user.rol);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  color: COLOR_BLACK_LAEL,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: double.infinity,
                    child: Card(
                      color: COLOR_WHITE,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              // backgroundImage: AssetImage('assets/avatar.jpg'),
                              radius: 60,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(user.username),
                            Text(user.rol ? 'Profesor/a' : 'Estudiante'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              // height: 348,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const ListTile(
                  //   leading: Icon(Icons.dashboard, color: Colors.blue),
                  //   title: Text('Dashboard'),
                  // ),
                  // const ListTile(
                  //   leading: Icon(Icons.history, color: Colors.blue),
                  //   title: Text('Payment History'),
                  // ),
                  // const ListTile(
                  //   leading: Icon(Icons.bar_chart, color: Colors.blue),
                  //   title: Text('Statistics'),
                  // ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: SuzumakukarButton(
                        texto: 'Editar Perfil',
                        onPressed: () {},
                        color: COLOR_BLACK_LAEL,
                        textColor: COLOR_WHITE),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: SuzumakukarButton(
                        texto: 'Cerrar Sesión',
                        onPressed: () async {
                          await vm.logout();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (currentContext) =>
                                    MyApp(locator<AuthUseCases>()),
                              ),
                              (route) => false);
                        },
                        color: COLOR_BLACK_LAEL,
                        textColor: COLOR_WHITE),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
