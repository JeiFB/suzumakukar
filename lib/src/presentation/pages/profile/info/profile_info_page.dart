import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';

import 'package:suzumakukar/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/profile/info/widgets/profile_info_content.dart';

class ProfileInfoPage extends StatelessWidget {
  final UserData _userData;
  const ProfileInfoPage(this._userData, {super.key});

  @override
  Widget build(BuildContext context) {
    // ProfileInfoViewModel vm = Provider.of<ProfileInfoViewModel>(context);
    return Scaffold(
      appBar: const SuzumakukarAppBar(
          null, 'PERFIL', COLOR_WHITE, null, COLOR_BLACK_LAEL),
      // backgroundColor: BACKGROUND_COLOR,
      // body: ProfileContent()
      body: ProfileInfoContent(_userData),

      // StreamBuilder(
      //     stream: vm.getUserById(),
      //     builder: ((context, snapshot) {
      //       // snapshot -> informacion
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       if (!snapshot.hasData) {
      //         return const Center(
      //           child: Text('No hay informacion'),
      //         );
      //       }
      //       final response = snapshot.data;
      //       if (response is Error) {
      //         final data = response as Error;
      //         return Center(
      //           child: Text('Error: ${data.error}'),
      //         );
      //       }
      //       final success = response as Success<UserData>;
      //       return ProfileInfoContent(vm, success.data, vmh);
      //     })),
    );
  }
}
