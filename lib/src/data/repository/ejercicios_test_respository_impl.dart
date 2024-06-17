import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_test_repository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class EjerciciosTestRespositoryImpl implements EjerciciosTestRepository {
  final CollectionReference _ejerciciosRef;
  EjerciciosTestRespositoryImpl(@Named('test') this._ejerciciosRef);

  @override
  Future<Resource<String>> createEjercicio(
      String idTest, EjerciciosMultiple ejercicio) async {
    try {
      final DocumentReference data = await _ejerciciosRef
          .doc(idTest)
          .collection('ejercicios')
          .add(ejercicio.toJson());
      String dataId = data.id;
      await data.update({'id': dataId});
      return Success('Ejercicio agregado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

//eliminar
  @override
  Future<Resource<String>> deleteEjercicio(
      String idTest, String idEjercicio) async {
    try {
      await _ejerciciosRef
          .doc(idTest)
          .collection('ejercicios')
          .doc(idEjercicio)
          .delete();
      return Success('Ejercicio eliminado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

//listar
  @override
  Stream<Resource<List<EjerciciosMultiple>>> getEjercicios(String idTest) {
    try {
      final data = _ejerciciosRef
          .doc(idTest)
          .collection('ejercicios')
          .orderBy('ejercicio')
          .snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs
          .map((ejercicios) => EjerciciosMultiple.fromJson(ejercicios.data()))
          .toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource<String>> update(
      String idTest, EjerciciosMultiple ejercicios) async {
    try {
      Map<String, dynamic> map = {
        'ejercicio': ejercicios.ejercicio,
        'descripcion': ejercicios.descripcion,
        'opciones': ejercicios.opciones,
        'respuesta': ejercicios.respuesta
      };
      final data = await _ejerciciosRef
          .doc(idTest)
          .collection('ejercicios')
          .doc(ejercicios.id)
          .update(map);
      return Success('El test se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
}
