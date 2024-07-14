import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/domain/repository/lectura_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class LecturaRepositoryImpl implements LecturaRepository {
  final CollectionReference _lecturaRef;
  LecturaRepositoryImpl(@Named('lectura') this._lecturaRef);
  @override
  Future<Resource<String>> createLectura(Lectura lectura) async {
    try {
      final DocumentReference data = await _lecturaRef.add(lectura.toJson());
      final String dataId = data.id;
      await data.update({'id': dataId});
      return Success('Lectura agregada');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error Desconocido');
    }
  }

  @override
  Future<Resource<String>> deleteLectura(String id) async {
    try {
      await _lecturaRef.doc(id).delete();
      return Success('Lectura eliminada');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Stream<Resource<List<Lectura>>> getLectura() {
    try {
      final data = _lecturaRef.snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs
          .map((lectura) =>
              Lectura.fromJson(lectura.data() as Map<String, dynamic>))
          .toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource<String>> updateLectura(Lectura lectura) async {
    try {
      Map<String, dynamic> map = {
        'titulo': lectura.titulo,
        'texto': lectura.texto,
      };
      await _lecturaRef.doc(lectura.id).update(map);
      return Success('El texto se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
}
