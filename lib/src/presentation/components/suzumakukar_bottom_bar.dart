import 'package:flutter/material.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_viewmodel.dart';

class SuzumakukarBottomBar extends StatelessWidget {
  final HomeViewModel vm;

  const SuzumakukarBottomBar(this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 24,
        currentIndex: vm.currentIndex,
        onTap: (index) {
          vm.currentIndex = index;
        },
        selectedItemColor: COLOR_BLUE_MACAW,
        unselectedItemColor: COLOR_BLACK_SWAN,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Clases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Desafios',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.checklist_rtl_sharp),
          //   label: 'Test',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            label: 'Lectura',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        unselectedLabelStyle: const TextStyle(
          color: COLOR_BLACK_SWAN,
          fontFamily: 'DINNextRoundedLTPro',
          fontWeight: FontWeight.bold,
        ),
        selectedLabelStyle: const TextStyle(
          color: COLOR_GREEN_PASTEL,
          fontFamily: 'DINNextRoundedLTPro',
          fontWeight: FontWeight.bold,
        ));
  }
}
