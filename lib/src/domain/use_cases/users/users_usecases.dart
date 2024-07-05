import 'package:suzumakukar/src/domain/use_cases/users/get_all_users_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/users/get_users_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/users/update_img_user_usecase.dart';

class UsersUseCases {
  GetUsersUseCase getUserById;
  GetAllUsersUsecase getAllUsers;
  UpdateImgUserUsecase updateImg;
  UsersUseCases(
      {required this.getUserById,
      required this.getAllUsers,
      required this.updateImg});
}
