import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class CompletedchallengesRepository {
  Stream<List<CompletedChallenges>> getCompleteChallende(String idUser);
  Future<Resource<String>> addCompleteChallend(
      CompletedChallenges completeChallenge, String idUser);
}
