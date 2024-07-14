import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:path/path.dart';

class EjerciciosDesafioRepositoryImpl implements EjerciciosDesafiosRepository {
  final CollectionReference _ejerciciosRef;
  final Reference _desafioImgReference;
  EjerciciosDesafioRepositoryImpl(@Named('desafios') this._ejerciciosRef,
      @Named('desafios') this._desafioImgReference);

  //crear
  @override
  Future<Resource<String>> createEjercicio(
      String idDesafio, EjerciciosMultiple ejercicio) async {
    try {
      final DocumentReference data = await _ejerciciosRef
          .doc(idDesafio)
          .collection('ejercicios')
          .add(ejercicio.toJson());
      String dataId = data.id;
      await data.update({'id': dataId});
      return Success('Ejercicio agregado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  //crear con img
  @override
  Future<Resource<String>> createWithImgEjercicio(
      String idDesafio, EjerciciosMultiple ejercicio, File image) async {
    try {
      String name = basename(image.path);
      TaskSnapshot uploadTask = await _desafioImgReference.child(name).putFile(
          image,
          SettableMetadata(
            contentType: 'image/png',
          ));

      final DocumentReference data = await _ejerciciosRef
          .doc(idDesafio)
          .collection('ejercicios')
          .add(ejercicio.toJson());
      String dataId = data.id;
      String url = await uploadTask.ref.getDownloadURL();
      await data.update({'img': url});
      await data.update({'id': dataId});
      return Success('Ejercicio agregado');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

//eliminar
  @override
  Future<Resource<String>> deleteEjercicio(
      String idDesafio, String idEjercicio) async {
    try {
      await _ejerciciosRef
          .doc(idDesafio)
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
  Stream<Resource<List<EjerciciosMultiple>>> getEjercicios(String idDesafio) {
    try {
      final data = _ejerciciosRef
          .doc(idDesafio)
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

  //update
  @override
  Future<Resource<String>> update(
      String idDesafio, EjerciciosMultiple ejercicios) async {
    try {
      Map<String, dynamic> map = {
        'ejercicio': ejercicios.ejercicio,
        'descripcion': ejercicios.descripcion,
        'opciones': ejercicios.opciones,
        'respuesta': ejercicios.respuesta
      };
      await _ejerciciosRef
          .doc(idDesafio)
          .collection('ejercicios')
          .doc(ejercicios.id)
          .update(map);
      return Success('El ejercicio se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  //update con img
  @override
  Future<Resource<String>> updateWithImg(
      String idDesafio, EjerciciosMultiple ejercicios, File image) async {
    try {
      String name = basename(image.path);
      TaskSnapshot uploadTask = await _desafioImgReference.child(name).putFile(
          image,
          SettableMetadata(
            contentType: 'image/png',
          ));
      String url = await uploadTask.ref.getDownloadURL();
      Map<String, dynamic> map = {
        'ejercicio': ejercicios.ejercicio,
        'descripcion': ejercicios.descripcion,
        'opciones': ejercicios.opciones,
        'respuesta': ejercicios.respuesta,
        'img': url
      };
      await _ejerciciosRef
          .doc(idDesafio)
          .collection('ejercicios')
          .doc(ejercicios.id)
          .update(map);
      return Success('El ejercicio se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
}
