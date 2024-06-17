import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/create/create_cursos_viewmodel.dart';

class CreateCursosResponse {
  BuildContext context;
  CreateCursosViewModel vm;
  CreateCursosResponse(this.context, this.vm) {
    handleResponse(vm, context);
  }
}
