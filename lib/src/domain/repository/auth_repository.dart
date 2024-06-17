import 'package:firebase_auth/firebase_auth.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class AuthRepository {
  User? get user;
  Future<Resource> login({required String username, required String password});
  Future<Resource> register(UserData user);
  // Future<bool> isAdmin(String id);
  Future<void> logout();
}
