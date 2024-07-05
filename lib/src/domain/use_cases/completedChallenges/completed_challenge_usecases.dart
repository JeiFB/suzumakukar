import 'package:suzumakukar/src/domain/use_cases/completedChallenges/add_completed_challenge_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/get_completed_challenge_usecase.dart';

class CompletedChallengeUseCases {
  final AddCompletedChallengeUseCase addCompleteChallenge;
  final GetCompletedChallengeUseCase getCompleteChallenge;
  CompletedChallengeUseCases(
      {required this.addCompleteChallenge, required this.getCompleteChallenge});
}
