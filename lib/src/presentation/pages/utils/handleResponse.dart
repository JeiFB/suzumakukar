import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/utils/show_dialog.dart';

void handleResponse(dynamic vm, BuildContext context) {
  if (vm.response is Loading) {
    buildShowDialog(context);
  } else if (vm.response is Error) {
    final data = vm.response as Error;
    handleResponseError(vm, data.error, context);
  } else if (vm.response is Success) {
    final success = vm.response as Success<String>;
    handleResponseSuccess(vm, success.data, context);
  }
}

void handleResponseError(
    dynamic vm, String errorMessage, BuildContext context) {
  Navigator.pop(context);
  Fluttertoast.showToast(
    msg: errorMessage,
    timeInSecForIosWeb: 4,
    toastLength: Toast.LENGTH_LONG,
  );
  vm.resetResponse();
}

void handleResponseSuccess(
    dynamic vm, String successMessage, BuildContext context) {
  Navigator.pop(context);
  Fluttertoast.showToast(
    msg: successMessage,
    timeInSecForIosWeb: 4,
    toastLength: Toast.LENGTH_LONG,
  );
  if (context != null && ModalRoute.of(context)?.isCurrent == true) {
    // No hagas pop si estás en la pantalla principal
    vm.resetResponse();
    vm.resetState();
  } else {
    // Si no estás en la pantalla principal, haz pop
    // Navigator.pop(context);
    Navigator.pop(context);
    vm.resetResponse();
    vm.resetState();
  }
  // Navigator.pop(context);
  // vm.resetResponse();
  // vm.resetState();
}


//por si las moscas
    // if (vm.response is Loading) {
    //   buildShowDialog(context);
    // } else if (vm.response is Error) {
    //   final data = vm.response as Error;
    //   Navigator.pop(context);
    //   Fluttertoast.showToast(
    //       msg: data.error,
    //       timeInSecForIosWeb: 4,
    //       toastLength: Toast.LENGTH_LONG);
    //   vm.resetResponse();
    // } else if (vm.response is Success) {
    //   final success = vm.response as Success<String>;
    //   Navigator.pop(context);
    //   Fluttertoast.showToast(
    //       msg: success.data,
    //       timeInSecForIosWeb: 4,
    //       toastLength: Toast.LENGTH_LONG);
    //   vm.resetResponse();
    //   vm.resetState();
    // }