import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class UserRepository {
  Stream<Resource<UserData>> getUserById(String id);
}
