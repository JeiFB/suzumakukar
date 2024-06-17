import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/repository/user_respository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class UserRepositoryImpl implements UserRepository {
  final CollectionReference _usersRef;
  UserRepositoryImpl(@Named('users') this._usersRef);

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
}
