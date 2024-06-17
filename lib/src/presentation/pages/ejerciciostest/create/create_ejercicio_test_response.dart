import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/create/create_ejercicio_test_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class CreateEjercicioTestResponse {
  BuildContext context;
  CreateEjercicioTestViewModel vm;
  CreateEjercicioTestResponse(this.context, this.vm) {
    handleResponse(vm, context);
  }
}
