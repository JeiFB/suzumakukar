import 'package:flutter/foundation.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';

class ProfileInfoViewModel extends ChangeNotifier {
  final AuthUseCases _authUseCases;

  ProfileInfoViewModel(this._authUseCases);

  logout() async {
    await _authUseCases.logout.launch();
  }
}
