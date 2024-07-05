import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_bottom_bar.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/list/cursos_list_page.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/list/desafios_page.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/list/lecturas_list_page.dart';
import 'package:suzumakukar/src/presentation/pages/profile/info/profile_info_page.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class HomePage extends StatelessWidget {
  final UserData _userData;
  const HomePage(this._userData, {super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel vm = Provider.of<HomeViewModel>(context);
    RolUser rolUser = Provider.of<RolUser>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      rolUser.setIdUser(_userData.rol);
    });
    final currentTab = [
      CursosListPage(_userData.rol),
      const DesafiosPage(),
      // const TestListPage(),
      LecturaListPage(_userData.rol),
      ProfileInfoPage(_userData, vm),
    ];
    return Scaffold(
      body: currentTab[vm.currentIndex],
      bottomNavigationBar: SuzumakukarBottomBar(vm),
    );
  }
}
