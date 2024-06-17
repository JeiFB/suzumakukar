import 'package:suzumakukar/src/domain/models/cursos.dart';
import 'package:suzumakukar/src/domain/models/ejercicios.dart';
import 'package:suzumakukar/src/domain/models/niveles.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class CursosRepository {
  //curso
  Stream<Resource<List<Cursos>>> getCursos();
  Future<Resource<String>> createCurso(Cursos curso);
  Future<Resource<String>> deleteCurso(String id);

  //Niveles
  Stream<Resource<List<Niveles>>> getNivelesId(String id);
  Future<Resource<String>> createNiveles(Niveles nivel, String id);
  Future<Resource<String>> deleteNivel(String idCurso, String idNivel);

  //Ejercicios
  Stream<Resource<List<Ejercicios>>> getEjerciciosId(
      String idCurso, String idEjercicios);
  Future<Resource<String>> createEjercicio(
      String idCurso, String idNivel, Ejercicios ejercicio);
  Future<Resource<String>> deleteEjercicio(
      String idCurso, String idNivel, String idEjercicio);
  Future<Resource<String>> update(
      String isCurso, String idNivel, Ejercicios ejercicios);
}
