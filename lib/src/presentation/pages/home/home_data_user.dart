import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_page.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class HomeDataUser extends StatelessWidget {
  const HomeDataUser({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel vm = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: StreamBuilder(
          stream: vm.getUserById(),
          builder: ((context, snapshot) {
            // snapshot -> informacion
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No hay informacion'),
              );
            }
            final response = snapshot.data;
            if (response is Error) {
              final data = response as Error;
              return Center(
                child: Text('Error: ${data.error}'),
              );
            }
            final success = response as Success<UserData>;
            return HomePage(success.data);
          })),
    );
  }
}
