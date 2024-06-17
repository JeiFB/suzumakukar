import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/injection.dart';
import 'package:suzumakukar/main.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/presentation/pages/auth/login/widgets/login_content.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    LoginViewModel vm = Provider.of<LoginViewModel>(context);

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   LoginResponse(vm, context);
    // });
// SingleChildScrollView(child: LoginContent(vm))
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      appBar: SuzumakukarAppBar(const Icon(Icons.arrow_back_ios_sharp),
          'Ingresa tus datos', COLOR_GREY, () {
        Navigator.pop(context);
      }, COLOR_WHITE),
      body: Stack(
        children: [
          StreamBuilder(
              stream: vm.response,
              builder: (context, snapshot) {
                final response = snapshot.data;
                if (response is Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (response is Error) {
                  final data = response;
                  Fluttertoast.showToast(
                      msg: data.error,
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 3);
                } else if (response is Success) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(locator<AuthUseCases>()),
                        ),
                        (route) => false);
                  });
                }
                return Container();
              }),
          LoginContent(vm)
        ],
      ),
    );
  }
}
