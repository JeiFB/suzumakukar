import 'package:suzumakukar/src/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  launch({required String username, required String password}) =>
      _authRepository.login(username: username, password: password);
}
