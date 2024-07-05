import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/profile/info/widgets/profile_info_content.dart';
import 'package:suzumakukar/src/presentation/pages/profile/updateImg/update_img_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';

class ProfileInfoPage extends StatelessWidget {
  final UserData _userData;
  final HomeViewModel vm;
  const ProfileInfoPage(this._userData, this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    // UpdateImgViewModel vm = Provider.of<UpdateImgViewModel>(context);
    ProfileInfoViewModel vmProfile = Provider.of<ProfileInfoViewModel>(context);
    RolUser rolUser = Provider.of<RolUser>(context);
    return Scaffold(
      appBar: const SuzumakukarAppBar(
          null, 'PERFIL', COLOR_WHITE, null, COLOR_BLACK_LAEL),
      // backgroundColor: BACKGROUND_COLOR,
      // body: ProfileContent()
      body: ProfileInfoContent(_userData, vm, vmProfile, rolUser.rol),
    );
  }
}
