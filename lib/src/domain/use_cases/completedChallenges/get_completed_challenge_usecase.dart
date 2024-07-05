import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/repository/completed_challenges_repository.dart';

class GetCompletedChallengeUseCase {
  final CompletedchallengesRepository _completedchallengesRepository;

  GetCompletedChallengeUseCase(this._completedchallengesRepository);

  Stream<List<CompletedChallenges>> launch(String idUser) =>
      _completedchallengesRepository.getCompleteChallende(idUser);
}
