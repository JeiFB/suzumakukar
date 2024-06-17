import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/test.dart';
import 'package:suzumakukar/src/domain/repository/test_repository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class TestRepositoryImpl implements TestRepositoy {
  final CollectionReference _testRef;
  TestRepositoryImpl(@Named('test') this._testRef);
  @override
  Future<Resource<String>> createTest(Test test) async {
    try {
      final DocumentReference data = await _testRef.add(test.toJson());
      final String testId = data.id;
      await data.update({'id': testId});
      return Success('test agregado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconodico');
    }
  }

  @override
  Future<Resource<String>> deleteTest(String idTest) async {
    try {
      await _testRef.doc(idTest).delete();
      return Success('Test eliminado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Stream<Resource<List<Test>>> getTest() {
    try {
      final data = _testRef.snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs
          .map((test) => Test.fromJson(test.data() as Map<String, dynamic>))
          .toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }
}
