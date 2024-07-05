import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/repository/user_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:path/path.dart';

class UserRepositoryImpl implements UserRepository {
  final CollectionReference _usersRef;
  final Reference _desafioImgReference;
  UserRepositoryImpl(@Named('users') this._usersRef,
      @Named('users') this._desafioImgReference);

  @override
  Stream<Resource<UserData>> getUserById(String id) {
    try {
      final data = _usersRef.doc(id).snapshots(includeMetadataChanges: true);
      final dataMap = data.map((doc) =>
          Success(UserData.fromJson(doc.data() as Map<String, dynamic>)));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Stream<Resource<List<UserData>>> getUser() {
    try {
      final data =
          _usersRef.orderBy('name').snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs
          .map((curso) =>
              UserData.fromJson(curso.data() as Map<String, dynamic>))
          .toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource<String>> addImg(String idUser, File image) async {
    try {
      String name = basename(image.path);
      TaskSnapshot uploadTask = await _desafioImgReference.child(name).putFile(
          image,
          SettableMetadata(
            contentType: 'image/png',
          ));
      String url = await uploadTask.ref.getDownloadURL();
      final data = await _usersRef.doc(idUser).update({'img': url});
      return Success('Foto de perfil Actualizada');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
}
