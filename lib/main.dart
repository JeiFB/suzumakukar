import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/injection.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/desafios/desafios_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/ejercicioDesafio/ejercicios_desafios_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/ejerciciosTest/ejercicios_test_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/lectura/lectura_usecases.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/test_%20usecases.dart';
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
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/create/create_ejercicio_test_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/create/create_ejercicio_test_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/list/ejercicio_test_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/list/ejercicio_test_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/update/ejercicio_test_update_page.dart';
import 'package:suzumakukar/src/presentation/pages/ejerciciostest/update/ejercicio_test_update_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_data_user.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_page.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/create/create_lectura_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/lecturas/list/lecturas_list_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/testPage/create/create_test_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/testPage/list/test_list_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_ejercicio.dart';
import 'package:suzumakukar/src/presentation/pages/utils/rol_user.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_curso.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/create/create_desafio_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/desafios/list/desafios_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_desafio.dart';
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
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_nivel.dart';
import 'package:suzumakukar/src/presentation/pages/resultados/screen_resultado_page.dart';
import 'package:suzumakukar/src/presentation/pages/utils/obtener_id_test.dart';

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
            create: (context) =>
                DesafiosViewModel(locator<DesafiosUseCases>())),
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
            create: (context) => TestListViewModel(locator<TestUseCases>())),
        ChangeNotifierProvider(
            create: (context) => CreateTestViewModel(locator<TestUseCases>())),
        ChangeNotifierProvider(
            create: (context) =>
                EjercicioTestViewModel(locator<EjerciciosTestUseCases>())),
        ChangeNotifierProvider(
            create: (context) => CreateEjercicioTestViewModel(
                locator<EjerciciosTestUseCases>())),
        ChangeNotifierProvider(
            create: (context) => EjercicioTestUpdateViewModel(
                locator<EjerciciosTestUseCases>())),
        ChangeNotifierProvider(
            create: (context) =>
                LecturaListViewModel(locator<LecturaUseCases>())),
        ChangeNotifierProvider(
            create: (context) =>
                CreateLecturaViewModel(locator<LecturaUseCases>())),

        //utils
        ChangeNotifierProvider(create: (context) => ObtenerIdEjercicio()),
        ChangeNotifierProvider(create: (context) => ObtenerIdCurso()),
        ChangeNotifierProvider(create: (context) => ObtenerIdNivel()),
        ChangeNotifierProvider(create: (context) => ObtenerIdDesafio()),
        ChangeNotifierProvider(create: (context) => ObtenerIdTest()),
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
            'screenresultadopage': (BuildContext context) =>
                const ScreenResultadoPage(),
            'ejerciciostestpage': (BuildContext context) =>
                const EjercicioTestPage(),
            'ejerciciostestupdatepage': (BuildContext context) =>
                const EjercicioTestUpdatePage(),
            'createjerciciotest': (BuildContext context) =>
                const CreateEjercicioTestPage(),
            'createlecturapage': (BuildContext context) =>
                const CreateLecturaPage(),
          }),
    );
  }
}
