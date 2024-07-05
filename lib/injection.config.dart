// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i16;
import 'package:firebase_storage/firebase_storage.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:suzumakukar/src/data/repository/auth_repository_impl.dart'
    as _i3;
import 'package:suzumakukar/src/di/app_module.dart' as _i25;
import 'package:suzumakukar/src/di/firebase_service.dart' as _i17;
import 'package:suzumakukar/src/domain/repository/completed_challenges_repository.dart'
    as _i7;
import 'package:suzumakukar/src/domain/repository/cursos_respository.dart'
    as _i8;
import 'package:suzumakukar/src/domain/repository/desafios_respository.dart'
    as _i10;
import 'package:suzumakukar/src/domain/repository/ejercicios_desafios_repository.dart'
    as _i13;
import 'package:suzumakukar/src/domain/repository/ejercicios_test_repository.dart'
    as _i14;
import 'package:suzumakukar/src/domain/repository/lectura_respository.dart'
    as _i19;
import 'package:suzumakukar/src/domain/repository/test_repository.dart' as _i21;
import 'package:suzumakukar/src/domain/repository/user_respository.dart'
    as _i23;
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart'
    as _i4;
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/completed_challenge_usecases.dart'
    as _i6;
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart'
    as _i9;
import 'package:suzumakukar/src/domain/use_cases/desafios/desafios_usecases.dart'
    as _i11;
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_usecases.dart'
    as _i12;
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/ejercicios_test_usecases.dart'
    as _i15;
import 'package:suzumakukar/src/domain/use_cases/lectura/lectura_usecases.dart'
    as _i20;
import 'package:suzumakukar/src/domain/use_cases/testExam/test_%20usecases.dart'
    as _i22;
import 'package:suzumakukar/src/domain/use_cases/users/users_usecases.dart'
    as _i24;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepositoryImpl>(() => appModule.authRepository);
    gh.factory<_i4.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.cursosRef,
      instanceName: 'cursos',
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.desafiosRef,
      instanceName: 'desafios',
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.lecturaRef,
      instanceName: 'lectura',
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.testRef,
      instanceName: 'test',
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.userRef,
      instanceName: 'users',
    );
    gh.factory<_i6.CompletedChallengeUseCases>(
        () => appModule.completeChallengeUseCases);
    gh.factory<_i7.CompletedchallengesRepository>(
        () => appModule.completeChallengeRepository);
    gh.factory<_i8.CursosRepository>(() => appModule.cursosRepository);
    gh.factory<_i9.CursosUseCase>(() => appModule.cursosUseCases);
    gh.factory<_i10.DesafiosRepository>(() => appModule.desafiosRepository);
    gh.factory<_i11.DesafiosUseCases>(() => appModule.desafiosUseCases);
    gh.factory<_i12.EjerciciosDesafioUseCases>(
        () => appModule.ejerciciosUseCases);
    gh.factory<_i13.EjerciciosDesafiosRepository>(
        () => appModule.ejerciciosDesafiosRepository);
    gh.factory<_i14.EjerciciosTestRepository>(
        () => appModule.ejerciciosTestRepository);
    gh.factory<_i15.EjerciciosTestUseCases>(() => appModule.ejercicioUseCases);
    gh.factory<_i16.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.firebaseFirestore);
    await gh.factoryAsync<_i17.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i18.FirebaseStorage>(() => appModule.firebaseStorage);
    gh.factory<_i19.LecturaRepository>(() => appModule.lecturaRespository);
    gh.factory<_i20.LecturaUseCases>(() => appModule.lecturaUseCases);
    gh.factory<_i18.Reference>(
      () => appModule.desafioStorageRef,
      instanceName: 'desafios',
    );
    gh.factory<_i21.TestRepositoy>(() => appModule.testRespository);
    gh.factory<_i22.TestUseCases>(() => appModule.testUseCases);
    gh.factory<_i23.UserRepository>(() => appModule.usersRepository);
    gh.factory<_i24.UsersUseCases>(() => appModule.userUseCase);
    return this;
  }
}

class _$AppModule extends _i25.AppModule {}
