import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class CreateLecturaResponse {
  BuildContext context;
  CreateLecturaViewModel vm;

  CreateLecturaResponse(this.vm, this.context) {
    handleResponse(vm, context);
  }
}
