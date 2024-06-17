import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usescases/create_cursos_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usescases/delete_curso_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usescases/get_cursos_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/ejercicios_usescases/Delete_ejercicios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/ejercicios_usescases/create_ejercicios.usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/ejercicios_usescases/get_ejercicios.usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/ejercicios_usescases/update_ejercicios_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/niveles_usescases/create_niveles_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/niveles_usescases/delete_niveles_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/niveles_usescases/get_niveles.dart';

class CursosUseCase {
  GetCursosUseCase getCursos;
  CreateCursosUseCase createCursos;
  DeleteCursoUsecase deleteCursos;
  GetNiveles getNiveles;
  CreateNivelesUseCase createNiveles;
  DeleteNivelesUseCase deleteNiveles;
  GetEjerciciosUseCase getEjercicios;
  CreateEjerciciosUseCase createEjercicios;
  DeleteEjerciciosUseCase deleteEjercicios;
  UpdateEjercicioUseCase updateEjercicio;

  CursosUseCase({
    required this.getCursos,
    required this.createCursos,
    required this.deleteCursos,
    required this.getNiveles,
    required this.createNiveles,
    required this.deleteNiveles,
    required this.getEjercicios,
    required this.createEjercicios,
    required this.deleteEjercicios,
    required this.updateEjercicio,
  });
}
