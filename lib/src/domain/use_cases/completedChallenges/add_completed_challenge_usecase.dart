import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/repository/completed_challenges_repository.dart';

class AddCompletedChallengeUseCase {
  final CompletedchallengesRepository _completedchallengesRepository;
  AddCompletedChallengeUseCase(this._completedchallengesRepository);

  launch(CompletedChallenges completeChallenge, String idUser) =>
      _completedchallengesRepository.addCompleteChallend(
          completeChallenge, idUser);
}
