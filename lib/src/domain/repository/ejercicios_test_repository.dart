import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class EjerciciosTestRepository {
  Future<Resource<String>> createEjercicio(
      String idTest, EjerciciosMultiple ejercicio);
  Future<Resource<String>> deleteEjercicio(String idTest, String idEjercicio);
  Stream<Resource<List<EjerciciosMultiple>>> getEjercicios(String idTest);
  Future<Resource<String>> update(String idTest, EjerciciosMultiple ejercicios);
}
