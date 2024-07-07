import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/update/update_lectura_response.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/update/update_lectura_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/update/widgets/update_lectura_content.dart';

class UpdateLecturaPage extends StatelessWidget {
  const UpdateLecturaPage({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateLecturaViewModel vm = Provider.of<UpdateLecturaViewModel>(context);
    Lectura lecturaArgu = ModalRoute.of(context)?.settings.arguments as Lectura;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      UpdateLecturaResponse(vm, context);
    });
    return Scaffold(
        appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_new),
            'Actualizar lectura', COLOR_WHITE, () {
          Navigator.pop(context);
        }, COLOR_COFFE_BEAK_INNER),
        body: FutureBuilder(
            future: vm.loadData(lecturaArgu),
            builder: (context, _) => UpdateLecturaContent(vm, lecturaArgu))
        //  UpdateLecturaContent(vm, lecturaArgu),
        );
  }
}
