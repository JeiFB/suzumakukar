// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/show_dialog.dart';
// import 'package:suzumakukar/src/presentation/pages/auth/register/register_viewmodel.dart';

// class RegisterResponse {
//   BuildContext context;
//   RegisterViewmodel vm;

//   RegisterResponse(this.context, this.vm) {
//     if (vm.response is Loading) {
//       buildShowDialog(context);
//     } else if (vm.response is Error) {
//       final data = vm.response as Error;
//       Fluttertoast.showToast(
//           msg: 'error desconocido',
//           timeInSecForIosWeb: 3,
//           toastLength: Toast.LENGTH_LONG);
//       vm.resetReponse();
//     } else if (vm.response is Success) {
//       Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
//     }
//   }
// }
