import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/repository/user_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetAllUsersUsecase {
  final UserRepository _repository;
  GetAllUsersUsecase(this._repository);

  Stream<Resource<List<UserData>>> launch() => _repository.getUser();
}
