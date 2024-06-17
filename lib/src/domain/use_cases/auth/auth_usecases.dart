import 'package:suzumakukar/src/domain/use_cases/auth/isadmin_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/login_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/logout_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/register_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/user_session_usecase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  UserSessionUseCase getUser;
  LogoutUseCase logout;
  // IsAdmin isAdmin;

  AuthUseCases({
    required this.login,
    required this.register,
    required this.getUser,
    required this.logout,
    // required this.isAdmin
  });
}
