// import 'dart:io';

import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/users/users_usecases.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';

class ProfileInfoViewModel extends ChangeNotifier {
  final AuthUseCases _authUseCases;

  ProfileInfoViewModel(this._authUseCases);

  logout() async {
    await _authUseCases.logout.launch();
  }
}
