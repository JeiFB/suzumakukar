import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/update/update_lectura_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class UpdateLecturaResponse {
  BuildContext context;
  UpdateLecturaViewModel vm;

  UpdateLecturaResponse(this.vm, this.context) {
    handleResponse(vm, context);
  }
}
