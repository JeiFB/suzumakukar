import 'package:flutter/widgets.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/create/create_niveles_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class CreateNivelesResponse {
  BuildContext context;
  CreateNivelesViewModel vm;

  CreateNivelesResponse(this.context, this.vm) {
    handleResponse(vm, context);
  }
}
