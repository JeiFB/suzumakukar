import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_floatingactionbutton.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/create/create_desafio_response.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/create/create_desafio_viewmodel.dart';

class CreateDesafioPage extends StatelessWidget {
  const CreateDesafioPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color iconColor = COLOR_ORANGE_FOX;
    Color colorButtom = COLOR_ORANGE_FOX;
    CreateDesafioViewModel vm = Provider.of<CreateDesafioViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CreateDesafioResponse(vm, context);
    });
    return SuzumakukarFloatingActionButton(
        colorButtom, false, iconColor, 'Desafio', (value) {
      vm.changeDesafio(value);
    }, (value) {
      null;
    }, (value) {
      vm.changeTema(value);
    }, () {
      vm.createDesafio();
      Navigator.pop(context);
    });
  }
}
