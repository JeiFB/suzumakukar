import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/completed_challenge_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/users/users_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetNotasViewmodel extends ChangeNotifier {
  final UsersUseCases _usersUseCases;
  final CompletedChallengeUseCases _completedChallengeUseCases;
  GetNotasViewmodel(this._usersUseCases, this._completedChallengeUseCases);

  Stream<Resource<List<UserData>>> getUsers() =>
      _usersUseCases.getAllUsers.launch();

  Stream<List<CompletedChallenges>> completedChallenges(String id) =>
      _completedChallengeUseCases.getCompleteChallenge.launch(id);
}
