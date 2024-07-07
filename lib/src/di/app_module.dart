import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:suzumakukar/src/data/repository/auth_repository_impl.dart';
import 'package:suzumakukar/src/data/repository/completed_challenges_repository_impl.dart';
import 'package:suzumakukar/src/data/repository/cursos_repository_impl.dart';
import 'package:suzumakukar/src/data/repository/desafios_repository_impl.dart';
import 'package:suzumakukar/src/data/repository/ejercicios_desafio_repository_impl.dart';
import 'package:suzumakukar/src/data/repository/ejercicios_test_respository_impl.dart';
import 'package:suzumakukar/src/data/repository/lectura_respository_impl.dart';
import 'package:suzumakukar/src/data/repository/test_repository_impl.dart';
import 'package:suzumakukar/src/data/repository/user_respository_impl.dart';
import 'package:suzumakukar/src/di/firebase_service.dart';
import 'package:suzumakukar/src/domain/repository/completed_challenges_repository.dart';
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart';
import 'package:suzumakukar/src/domain/repository/desafios_respository.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart';
import 'package:suzumakukar/src/domain/repository/ejercicios_test_repository.dart';
import 'package:suzumakukar/src/domain/repository/lectura_respository.dart';
import 'package:suzumakukar/src/domain/repository/test_repository.dart';
import 'package:suzumakukar/src/domain/repository/user_respository.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/login_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/logout_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/register_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/user_session_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/add_completed_challenge_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/completed_challenge_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/get_completed_challenge_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usescases/create_cursos_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usescases/delete_curso_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usescases/get_cursos_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/ejercicios_usescases/Delete_ejercicios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/ejercicios_usescases/create_ejercicios.usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/ejercicios_usescases/get_ejercicios.usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/ejercicios_usescases/update_ejercicios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/niveles_usescases/create_niveles_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/niveles_usescases/delete_niveles_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/niveles_usescases/get_niveles.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/create_desafios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/delete_desafios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/desafios_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/get_desafios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/create_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/create_ejercicio_img_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/delete_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_image_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/get_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/update_ejercicio_desafio_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/create_ejercicio_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/delete_ejercicio_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/ejercicios_test_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/get_ejercicio_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/update_ejercicio_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/create_lectura_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/delete_lectura_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/get_lectura_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/lectura_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/update_lectura_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/create_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/delete_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/get_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/test_%20usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/users/get_all_users_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/users/get_users_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/users/update_img_user_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/users/users_usecases.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @injectable
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @Named('users')
  @injectable
  CollectionReference get userRef => firebaseFirestore.collection('users');

  @Named('users')
  @injectable
  Reference get usersStorageRef => firebaseStorage.ref().child('users');

  @Named('cursos')
  @injectable
  CollectionReference get cursosRef => firebaseFirestore.collection('Cursos');

  @Named('desafios')
  @injectable
  CollectionReference get desafiosRef =>
      firebaseFirestore.collection('desafios');

  @Named('desafios')
  @injectable
  Reference get desafioStorageRef => firebaseStorage.ref().child('desafios');

  @Named('test')
  @injectable
  CollectionReference get testRef => firebaseFirestore.collection('test');

  @Named('lectura')
  @injectable
  CollectionReference get lecturaRef => firebaseFirestore.collection('lectura');

  @injectable
  AuthRepositoryImpl get authRepository =>
      AuthRepositoryImpl(firebaseAuth, userRef);

  UserRepository get usersRepository =>
      UserRepositoryImpl(userRef, usersStorageRef);

  CursosRepository get cursosRepository => CursosRepositoryImpl(cursosRef);

  DesafiosRepository get desafiosRepository =>
      DesafiosRepositoryImpl(desafiosRef);

  EjerciciosDesafiosRepository get ejerciciosDesafiosRepository =>
      EjerciciosDesafioRepositoryImpl(desafiosRef, desafioStorageRef);

  TestRepositoy get testRespository => TestRepositoryImpl(testRef);
  EjerciciosTestRepository get ejerciciosTestRepository =>
      EjerciciosTestRespositoryImpl(testRef);

  LecturaRepository get lecturaRespository => LecturaRepositoryImpl(lecturaRef);

  CompletedchallengesRepository get completeChallengeRepository =>
      CompletedChallengesRepositoryImpl(userRef);

// casos de usos
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        getUser: UserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository),
        // isAdmin: IsAdmin(authRepository)
      );

  UsersUseCases get userUseCase => UsersUseCases(
      getUserById: GetUsersUseCase(usersRepository),
      getAllUsers: GetAllUsersUsecase(usersRepository),
      updateImg: UpdateImgUserUsecase(usersRepository));

  CursosUseCase get cursosUseCases => CursosUseCase(
        getCursos: GetCursosUseCase(cursosRepository),
        createCursos: CreateCursosUseCase(cursosRepository),
        deleteCursos: DeleteCursoUsecase(cursosRepository),
        getNiveles: GetNiveles(cursosRepository),
        createNiveles: CreateNivelesUseCase(cursosRepository),
        deleteNiveles: DeleteNivelesUseCase(cursosRepository),
        getEjercicios: GetEjerciciosUseCase(cursosRepository),
        createEjercicios: CreateEjerciciosUseCase(cursosRepository),
        deleteEjercicios: DeleteEjerciciosUseCase(cursosRepository),
        updateEjercicio: UpdateEjercicioUseCase(cursosRepository),
      );

  DesafiosUseCases get desafiosUseCases => DesafiosUseCases(
        createDesafio: CreateDesafiosUseCase(desafiosRepository),
        getDesafios: GetDesafiosUseCase(desafiosRepository),
        deleteDesafios: DeleteDesafiosUseCase(desafiosRepository),
      );

  EjerciciosDesafioUseCases get ejerciciosUseCases => EjerciciosDesafioUseCases(
        createEjercicioDesafio:
            CreateEjercicioDesafioUseCase(ejerciciosDesafiosRepository),
        createEjercicioImgUsecase:
            CreateEjercicioImgUsecase(ejerciciosDesafiosRepository),
        getEjercicioDesafio:
            GetEjercicioDesafioUseCase(ejerciciosDesafiosRepository),
        deleteEjercicioDesafio:
            DeleteEjercicioDesafioUseCase(ejerciciosDesafiosRepository),
        updateEjercicioDesafioUseCase:
            UpdateEjercicioDesafioUseCase(ejerciciosDesafiosRepository),
        ejerciciosDesafiosImageUsecase:
            EjerciciosDesafiosImageUsecase(ejerciciosDesafiosRepository),
      );

  TestUseCases get testUseCases => TestUseCases(
      createTest: CreateTestUseCase(testRespository),
      deleteTest: DeleteTestUseCase(testRespository),
      getTest: GetTestUseCase(testRespository));

  EjerciciosTestUseCases get ejercicioUseCases => EjerciciosTestUseCases(
      createEjercicioTest: CreateEjercicioTestUseCase(ejerciciosTestRepository),
      getEjercicioTest: GetEjercicioTestUseCase(ejerciciosTestRepository),
      deleteEjercicioTest: DeleteEjercicioTestUseCase(ejerciciosTestRepository),
      updateEjercicioTestUseCase:
          UpdateEjercicioTestUseCase(ejerciciosTestRepository));

  LecturaUseCases get lecturaUseCases => LecturaUseCases(
      createLectura: CreateLecturaUseCase(lecturaRespository),
      deleteLectura: DeleteLecturaUseCase(lecturaRespository),
      getLectura: GetLecturaUseCase(lecturaRespository),
      updateLectura: UpdateLecturaUsecase(lecturaRespository));

  CompletedChallengeUseCases get completeChallengeUseCases =>
      CompletedChallengeUseCases(
          addCompleteChallenge:
              AddCompletedChallengeUseCase(completeChallengeRepository),
          getCompleteChallenge:
              GetCompletedChallengeUseCase(completeChallengeRepository));
}
