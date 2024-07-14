import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/completedChallenges.dart';
import 'package:suzumakukar/src/domain/repository/completed_challenges_repository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class CompletedChallengesRepositoryImpl
    implements CompletedchallengesRepository {
  final CollectionReference _userRef;

  CompletedChallengesRepositoryImpl(@Named('users') this._userRef);

  @override
  Future<Resource<String>> addCompleteChallend(
      CompletedChallenges completedChallenge, String idUser) async {
    try {
      final DocumentReference data = await _userRef
          .doc(idUser)
          .collection('desafioscompletados')
          .add(completedChallenge.toJson());
      final String completeChallendId = data.id;
      await data.update({'id': completeChallendId});
      return Success('Desafio completado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Stream<List<CompletedChallenges>> getCompleteChallende(String idUser) {
    try {
      final data = _userRef
          .doc(idUser)
          .collection('desafioscompletados')
          .orderBy('desafioNumber')
          .snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => document.docs
          .map((desafio) => CompletedChallenges.fromJson(desafio.data()))
          .toList());
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }
}
