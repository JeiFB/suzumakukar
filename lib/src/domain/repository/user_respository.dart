import 'dart:io';

import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class UserRepository {
  Stream<Resource<List<UserData>>> getUser();
  Stream<Resource<UserData>> getUserById(String id);
  Future<Resource<String>> addImg(String idUser, File img);
}
