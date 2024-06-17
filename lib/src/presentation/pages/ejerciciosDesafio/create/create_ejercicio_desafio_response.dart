import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/create/create_ejercicio_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class CreateEjercicioDesafioResponse {
  BuildContext context;
  CreateEjercicioDesafioViewModel vm;
  CreateEjercicioDesafioResponse(this.context, this.vm) {
    handleResponse(vm, context);
  }
}
