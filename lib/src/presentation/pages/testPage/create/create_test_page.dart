// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:suzumakukar/src/colors/base_color.dart';
// import 'package:suzumakukar/src/presentation/components/suzumakukar_floatingactionbutton.dart';
// import 'package:suzumakukar/src/presentation/pages/testPage/create/create_test_response.dart';
// import 'package:suzumakukar/src/presentation/pages/testPage/create/create_test_viewmodel.dart';

// class CreateTestPage extends StatelessWidget {
//   const CreateTestPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Color iconColor = COLOR_PURPLE;
//     Color colorButtom = COLOR_PURPLE;
//     CreateTestViewModel vm = Provider.of<CreateTestViewModel>(context);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       CreateTestResponse(vm, context);
//     });
//     return SuzumakukarFloatingActionButton(
//         colorButtom, false, iconColor, 'Test', (value) {
//       vm.changeNameTest(value);
//     }, (value) {
//       vm.changeTema(value);
//     }, () {
//       vm.createTest();
//       Navigator.pop(context);
//     });
//   }
// }
