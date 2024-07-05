import 'dart:io';

import 'package:suzumakukar/src/domain/repository/user_respository.dart';

class UpdateImgUserUsecase {
  final UserRepository _userRepository;
  UpdateImgUserUsecase(this._userRepository);

  launch(String idUser, File img) => _userRepository.addImg(idUser, img);
}
