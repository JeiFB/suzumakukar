import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/create/create_niveles_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/show_dialog.dart';

class CreateNivelesResponse {
  BuildContext context;
  CreateNivelesViewModel vm;

  CreateNivelesResponse(this.context, this.vm) {
    if (vm.response is Loading) {
      buildShowDialog(context);
    } else if (vm.response is Error) {
      final data = vm.response as Error;
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: data.error,
          timeInSecForIosWeb: 4,
          toastLength: Toast.LENGTH_LONG);
      vm.resetResponse();
    } else if (vm.response is Success) {
      final success = vm.response as Success<String>;
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: success.data,
          timeInSecForIosWeb: 4,
          toastLength: Toast.LENGTH_LONG);
      vm.resetResponse();
      vm.resetState();
    }
  }
}
