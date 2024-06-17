// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/auth/login/login_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/utils/show_dialog.dart';

// class LoginResponse {
//   LoginViewModel vm;
//   BuildContext context;

//   LoginResponse(this.vm, this.context) {
//     if (vm.response is Loading) {
//       buildShowDialog(context);
//     } else if (vm.response is Error) {
//       final data = vm.response as Error;
//       Navigator.pop(context, true);
//       Fluttertoast.showToast(
//           msg: data.error,
//           toastLength: Toast.LENGTH_LONG,
//           timeInSecForIosWeb: 3);
//       vm.resetResponse();
//     } else if (vm.response is Success) {
//       // vm.resetResponse();
//       Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
//     }
//   }
// }
