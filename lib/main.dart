import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/injection.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/completedChallenges/completed_challenge_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/desafios_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/lectura_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/users/users_usecases.dart';
import 'package:suzumakukar/src/presentation/pages/auth/login/login_page.dart';
import 'package:suzumakukar/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/auth/register/register_page.dart';
import 'package:suzumakukar/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/auth/screen/screen_init.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/create/create_cursos_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/update/ejercicio_update_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/update/ejercicio_update_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/list/ejercicio_desafio_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/update/ejercicio_update_desafio_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/update/ejercicio_update_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_data_user.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_page.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/list/lecturas_list_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/update/update_lectura_page.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/update/update_lectura_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/notas/get_notas_page.dart';
import 'package:suzumakukar/src/presentation/pages/notas/get_notas_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadoDesafio/screen_resultado__desafio_page.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadoDesafio/screen_resultado__desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/resultadosNiveles/screen_resultado_nivel_page.dart';
import 'package:suzumakukar/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_ejercicio.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/create/create_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/list/desafios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/create/create_ejercicio_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/create/create_ejercicio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejercicios/list/ejercicios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/data_resultados.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/create/create_ejercicio_desafio_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/create/create_ejercicio_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciosDesafio/list/ejercicio_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/create/create_niveles_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/list/niveles_page.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/list/cursos_list_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/list/niveles_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp(
    locator<AuthUseCases>(),
  ));
}

class MyApp extends StatelessWidget {
  final AuthUseCases _authUseCases;
  const MyApp(this._authUseCases, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String idSession = _authUseCases.getUser.userSession?.uid ?? '';
    return MultiProvider(
      key: Key(idSession),
      providers: [
        ChangeNotifierProvider(
            create: (context) => LoginViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(
            create: (context) => RegisterViewmodel(locator<AuthUseCases>())),
        ChangeNotifierProvider(
            create: (context) => HomeViewModel(
                locator<AuthUseCases>(), locator<UsersUseCases>())),
        ChangeNotifierProvider(
            create: (context) => ProfileInfoViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(
            create: (context) => CursosListViewModel(locator<CursosUseCase>())),
        ChangeNotifierProvider(
            create: (context) => NivelesViewModel(locator<CursosUseCase>())),
        ChangeNotifierProvider(
            create: (context) => EjerciciosViewModel(locator<CursosUseCase>())),
        ChangeNotifierProvider(
            create: (context) =>
                CreateCursosViewModel(locator<CursosUseCase>())),
        ChangeNotifierProvider(
            create: (context) =>
                CreateNivelesViewModel(locator<CursosUseCase>())),
        ChangeNotifierProvider(
            create: (context) =>
                CreateEjercicioViewModel(locator<CursosUseCase>())),
        ChangeNotifierProvider(
            create: (context) =>
                CreateDesafioViewModel(locator<DesafiosUseCases>())),
        ChangeNotifierProvider(
            create: (context) => DesafiosViewModel(
                locator<DesafiosUseCases>(),
                locator<CompletedChallengeUseCases>(),
                locator<AuthUseCases>())),
        ChangeNotifierProvider(
            create: (context) => CreateEjercicioDesafioViewModel(
                locator<EjerciciosDesafioUseCases>())),
        ChangeNotifierProvider(
            create: (context) => EjercicioUpdateDesafioViewModel(
                locator<EjerciciosDesafioUseCases>())),
        ChangeNotifierProvider(
            create: (context) =>
                EjercicioUpdateViewModel(locator<CursosUseCase>())),
        ChangeNotifierProvider(
            create: (context) => EjercicioDesafioViewModel(
                locator<EjerciciosDesafioUseCases>())),
        ChangeNotifierProvider(
            create: (context) => GetNotasViewmodel(locator<UsersUseCases>(),
                locator<CompletedChallengeUseCases>())),
        ChangeNotifierProvider(
            create: (context) =>
                LecturaListViewModel(locator<LecturaUseCases>())),
        ChangeNotifierProvider(
            create: (context) =>
                CreateLecturaViewModel(locator<LecturaUseCases>())),
        ChangeNotifierProvider(
            create: (context) =>
                UpdateLecturaViewModel(locator<LecturaUseCases>())),
        ChangeNotifierProvider(
            create: (context) => ScreenResultadoDesafioViewModel(
                locator<CompletedChallengeUseCases>(),
                locator<AuthUseCases>())),

        //utils
        ChangeNotifierProvider(create: (context) => ObtenerIdEjercicio()),
        ChangeNotifierProvider(create: (context) => DataResultados()),
        ChangeNotifierProvider(create: (context) => RolUser()),
      ],
      child: MaterialApp(
          title: 'Suzumakukar',
          theme: ThemeData(
            textSelectionTheme: const TextSelectionThemeData(
                cursorColor: COLOR_BLUE_MACAW,
                selectionHandleColor: COLOR_BLUE_MACAW,
                selectionColor: COLOR_BLUE_TRANSPARENT),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: idSession.isEmpty ? 'screeninit' : 'home',
          routes: {
            'screeninit': (BuildContext context) => const ScreenInit(),
            'login': (BuildContext context) => const LoginPage(),
            'register': (BuildContext context) => const RegisterPage(),
            'home': (BuildContext context) => const HomeDataUser(),
            'niveles': (BuildContext context) => const NivelesPage(),
            'ejercicios': (BuildContext context) => const EjerciciosPage(),
            'createjercicio': (BuildContext context) =>
                const CreateEjercicioPage(),
            'updateejercicio': (BuildContext context) =>
                const EjercicioUpdatePage(),
            'ejerciciosdesafiopage': (BuildContext context) =>
                const EjercicioDesafioPage(),
            'createjerciciodesafio': (BuildContext context) =>
                const CreateEjercicioDesafioPage(),
            'ejercicioupdatedesafio': (BuildContext context) =>
                const EjercicioUpdateDesafioPage(),
            'createlecturapage': (BuildContext context) =>
                const CreateLecturaPage(),
            'updatelecturapage': (BuildContext context) =>
                const UpdateLecturaPage(),
            'screenresultadopage': (BuildContext context) =>
                const ScreenResultadoNivelPage(),
            'screenresultadodesafiopage': (BuildContext context) =>
                const ScreenResultadoDesafioPage(),
            'getnotaspage': (BuildContext context) => const GetNotasPage()
          }),
    );
  }
}
