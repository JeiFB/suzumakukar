// import 'dart:io';

import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/users/users_usecases.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';

class ProfileInfoViewModel extends ChangeNotifier {
  final AuthUseCases _authUseCases;
  final UsersUseCases _usersUseCases;

  // Resource _response = Init();
  // Resource get response => _response;

  // File? _imageFile;
  // File? get imageFile => _imageFile;

  ProfileInfoViewModel(this._authUseCases, this._usersUseCases);

  // updateImg() async {
  //   // print('State: ${_state.toEjercicio().toJson()}');
  //   _response = await _usersUseCases.updateImg
  //       .launch(_authUseCases.getUser.userSession?.uid ?? '', _imageFile!);
  //   notifyListeners();
  // }

  // Future<void> pickerImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   // final LostDataResponse response = await picker.retrieveLostData();
  //   // if (response.isEmpty) {
  //   //   return;
  //   // }
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     _imageFile = File(image.path);
  //     notifyListeners();
  //   }
  // }

  // resetResponse() {
  //   _response = Init();
  //   notifyListeners();
  // }

  logout() async {
    await _authUseCases.logout.launch();
  }
}
