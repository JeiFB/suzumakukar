import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadoDesafio/screen_resultado__desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class ScreenResultadoDesafioResponse {
  BuildContext context;
  ScreenResultadoDesafioViewModel vm;
  ScreenResultadoDesafioResponse(this.context, this.vm) {
    handleResponse(vm, context);
  }
}
