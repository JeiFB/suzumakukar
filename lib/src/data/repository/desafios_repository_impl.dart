import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/domain/repository/desafios_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class DesafiosRepositoryImpl implements DesafiosRepository {
  final CollectionReference _desafioRef;

  DesafiosRepositoryImpl(@Named('desafios') this._desafioRef);
  @override
  Future<Resource<String>> createDesafios(Desafios desafio) async {
    try {
      final DocumentReference data = await _desafioRef.add(desafio.toJson());
      final String desafioId = data.id;
      await data.update({'id': desafioId});
      return Success('Desafio agregado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconodido');
    }
  }

  @override
  Future<Resource<String>> deleteDesafios(String id) async {
    try {
      await _desafioRef.doc(id).delete();
      return Success('Curso eliminado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Stream<Resource<List<Desafios>>> getDesafios() {
    try {
      final data = _desafioRef
          .orderBy('desafio')
          .snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs
          .map((desafio) =>
              Desafios.fromJson(desafio.data() as Map<String, dynamic>))
          .toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }
}
