import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/cursos.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class CursosRepositoryImpl implements CursosRepository {
  final CollectionReference _cursosRef;

  CursosRepositoryImpl(
    @Named('cursos') this._cursosRef,
  );

  //Cursos
  //listar

  Future<int> getNivelesCount(String courseId) async {
    final QuerySnapshot levelsSnapshot =
        await _cursosRef.doc(courseId).collection('Niveles').get();
    return levelsSnapshot.docs.length;
  }

//Cursos
  //listar
  @override
  Stream<Resource<List<Cursos>>> getCursos() {
    try {
      final data = _cursosRef.snapshots(includeMetadataChanges: true);

      final dataMap = data.map((document) => Success(document.docs
          .map((curso) => Cursos.fromJson(curso.data() as Map<String, dynamic>))
          .toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  //crear curso
  @override
  Future<Resource<String>> createCurso(Cursos curso) async {
    try {
      final DocumentReference data = await _cursosRef.add(curso.toJson());
      final String cursoId = data.id;
      await data.update({'id': cursoId});
      return Success('Curso agregado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  //Borrar curso
  @override
  Future<Resource<String>> deleteCurso(String id) async {
    try {
      await _cursosRef.doc(id).delete();
      return Success('Curso eliminado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  //Niveles

  //listar niveles
  @override
  Stream<Resource<List<Niveles>>> getNivelesId(String id) {
    try {
      final data = _cursosRef
          .doc(id)
          .collection('Niveles')
          .orderBy('Nivel')
          .snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs
          .map((nivel) => Niveles.fromJson(nivel.data()))
          .toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  //Crear niveles
  @override
  Future<Resource<String>> createNiveles(Niveles nivel, String id) async {
    try {
      final DocumentReference data =
          await _cursosRef.doc(id).collection('Niveles').add(nivel.toJson());

      final String nivelId = data.id;
      await data.update({'id': nivelId});
      final int nivelesCount = await getNivelesCount(id);
      await _cursosRef.doc(id).update({'niveles': nivelesCount});

      return Success('Nivel agregado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  //borrar nivel
  @override
  Future<Resource<String>> deleteNivel(String idCurso, String idNivel) async {
    try {
      await _cursosRef.doc(idCurso).collection('Niveles').doc(idNivel).delete();
      final int nivelesCount = await getNivelesCount(idCurso);
      await _cursosRef.doc(idCurso).update({'niveles': nivelesCount});

      return Success('Nivel eliminado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  //Ejercicios
  //listar ejercicios

  @override
  Stream<Resource<List<Ejercicios>>> getEjerciciosId(
      String idCurso, String idEjercicios) {
    try {
      final data = _cursosRef
          .doc(idCurso)
          .collection('Niveles')
          .doc(idEjercicios)
          .collection('Ejercicios')
          .orderBy('ejercicio')
          .snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs
          .map((nivel) => Ejercicios.fromJson(nivel.data()))
          .toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  //crear ejercicios
  @override
  Future<Resource<String>> createEjercicio(
      String idCurso, String idNivel, Ejercicios ejercicio) async {
    try {
      final DocumentReference data = await _cursosRef
          .doc(idCurso)
          .collection('Niveles')
          .doc(idNivel)
          .collection('Ejercicios')
          .add(ejercicio.toJson());

      final String ejercicioId = data.id;
      await data.update({'id': ejercicioId});
      return Success('Ejercicio agregado correctamente');
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  // eliminar ejercicio
  @override
  Future<Resource<String>> deleteEjercicio(
      String idCurso, String idNivel, String idEjercicio) async {
    try {
      await _cursosRef
          .doc(idCurso)
          .collection('Niveles')
          .doc(idNivel)
          .collection('Ejercicios')
          .doc(idEjercicio)
          .delete();
      return Success('Ejercicio eliminado');
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource<String>> update(
      String idCurso, String idNivel, Ejercicios ejercicios) async {
    try {
      Map<String, dynamic> map = {
        'ejercicio': ejercicios.ejercicio,
        'descripcion': ejercicios.descripcion,
        'respuesta': ejercicios.respuesta,
        'ejecucion': ejercicios.ejecucion
      };
      final data = await _cursosRef
          .doc(idCurso)
          .collection('Niveles')
          .doc(idNivel)
          .collection('Ejercicios')
          .doc(ejercicios.id)
          .update(map);
      return Success('El ejercicio se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
}
