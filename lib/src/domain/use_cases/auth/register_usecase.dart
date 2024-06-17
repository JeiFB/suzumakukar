import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;
  RegisterUseCase(this._repository);

  launch(UserData user) => _repository.register(user);
}
