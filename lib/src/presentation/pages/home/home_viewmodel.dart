import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/users/users_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class HomeViewModel extends ChangeNotifier {
  final AuthUseCases _authUseCases;
  final UsersUseCases _usersUseCases;

  File? _imageFile;
  File? get imageFile => _imageFile;

  Resource _response = Init();
  Resource get response => _response;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  HomeViewModel(this._authUseCases, this._usersUseCases) {
    getUserById();
  }

  updateImg() async {
    // print('State: ${_state.toEjercicio().toJson()}');
    _response = Loading();
    notifyListeners();
    _response = await _usersUseCases.updateImg
        .launch(_authUseCases.getUser.userSession?.uid ?? '', _imageFile!);
    notifyListeners();
  }

  Future<void> pickerImage() async {
    final ImagePicker picker = ImagePicker();
    // final LostDataResponse response = await picker.retrieveLostData();
    // if (response.isEmpty) {
    //   return;
    // }
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  Future<void> takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  resetImg() {
    _imageFile = null;
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
