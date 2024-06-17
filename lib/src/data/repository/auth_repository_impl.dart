import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/repository/auth_repository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  final CollectionReference _usersRef;

  AuthRepositoryImpl(this._firebaseAuth, @Named('users') this._usersRef);

  Resource error(String error) {
    final erroMessage = errorMessages[error] ?? 'Error desconocido';
    return Error(erroMessage);
  }

  Map<String, String> errorMessages = {
    'invalid-credential': 'Nombre de usuario o contraseña inválidos',
    'user-not-found': 'Usuario no encontrado',
    'email-already-in-use': 'Esta cuenta ya está en uso'
  };

  @override
  Future<Resource> login(
      {required String username, required String password}) async {
    try {
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(
          email: username, password: password);
      return Success(data);
    } on FirebaseAuthException catch (e) {
      return error(e.code);
    }
  }

  @override
  Future<Resource> register(UserData user) async {
    try {
      UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
          email: '${user.username}@suzumakukar.com', password: user.password);
      user.password = "";
      user.id = data.user?.uid ?? "";
      await _usersRef.doc(user.id).set(user.toJson());
      return Success(data);
    } on FirebaseAuthException catch (e) {
      return error(e.code);
    }
  }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isAdmin(String userId) async {
    try {
      DocumentSnapshot userDoc = await _usersRef.doc(userId).get();
      UserData userData =
          UserData.fromJson(userDoc.data() as Map<String, dynamic>);
      return userData.rol;
    } catch (e) {
      return false; // Manejar cualquier error que ocurra durante la obtención de datos
    }
  }
}
