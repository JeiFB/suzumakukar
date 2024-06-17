// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/auth/screen/screen_init_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/auth/screen/utils/show_screen_dialog.dart';

// class ScreenResponse {
//   ScreenInitWiewModel vm;
//   BuildContext context;

//   ScreenResponse(this.vm, this.context) {
//     if (vm.response is Loading) {
//       buildShowScreenDialog(context);
//     } else if (vm.response is Error) {
//       final data = vm.response as Error;
//       Navigator.pop(context, true);
//       Fluttertoast.showToast(
//           msg: 'Error: ${data.error}',
//           toastLength: Toast.LENGTH_LONG,
//           timeInSecForIosWeb: 2);
//       vm.resetResponse();
//     } else if (vm.response is Success) {
//       vm.resetResponse();
//       Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
//     }
//   }
// }
