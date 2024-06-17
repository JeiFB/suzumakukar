import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/users/users_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class HomeViewModel extends ChangeNotifier {
  final AuthUseCases _authUseCases;
  final UsersUseCases _usersUseCases;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  HomeViewModel(this._authUseCases, this._usersUseCases) {
    getUserById();
  }

  // isAdmin() async {
  //   final data = await _authUseCases.isAdmin.launch(_id);
  //   if (data) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Stream<Resource<UserData>> getUserById() {
  //   final id = _authUseCases.getUser.userSession?.uid ?? '';
  //   return _usersUseCase.getUserById.launch(id);
  // }

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Stream<Resource<UserData>> getUserById() {
    final id = _authUseCases.getUser.userSession?.uid ?? '';
    return _usersUseCases.getUserById.launch(id);
  }
}
