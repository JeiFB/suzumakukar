import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/presentation/pages/auth/screen/screen_init_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/auth/screen/screen_response.dart';
import 'package:suzumakukar/src/presentation/pages/auth/screen/widgets/screen_content.dart';

class ScreenInit extends StatelessWidget {
  const ScreenInit({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenInitWiewModel vm = Provider.of<ScreenInitWiewModel>(context);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ScreenResponse(vm, context);
    // });

    return const Scaffold(body: ScreenContent());
  }
}
