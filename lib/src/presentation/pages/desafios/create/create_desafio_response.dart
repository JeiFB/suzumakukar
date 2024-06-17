import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/create/create_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class CreateDesafioResponse {
  BuildContext context;
  CreateDesafioViewModel vm;
  CreateDesafioResponse(this.vm, this.context) {
    handleResponse(vm, context);
  }
}
