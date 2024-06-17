import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/repository/user_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetUsersUseCase {
  final UserRepository _repository;
  GetUsersUseCase(this._repository);

  Stream<Resource<UserData>> launch(String id) => _repository.getUserById(id);
}
