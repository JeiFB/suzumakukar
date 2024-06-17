import 'package:flutter/material.dart';
import 'package:suzumakukar/src/presentation/pages/testPage/create/create_test_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/handleResponse.dart';

class CreateTestResponse {
  BuildContext context;
  CreateTestViewModel vm;
  CreateTestResponse(this.vm, this.context) {
    handleResponse(vm, context);
  }
}
