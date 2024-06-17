import 'package:suzumakukar/src/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _repository;
  LogoutUseCase(this._repository);

  launch() => _repository.logout();
}
