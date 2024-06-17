import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/create/create_ejercicio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class CreateEjercicioResponse {
  BuildContext context;
  CreateEjercicioViewModel vm;

  CreateEjercicioResponse(this.context, this.vm) {
    handleResponse(vm, context);
  }
}
