import 'dart:io';

import 'package:suzumakukar/src/domain/models/ejerciciosmultiple.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class EjerciciosDesafiosRepository {
  Future<Resource<String>> createEjercicio(
      String idDesafio, EjerciciosMultiple ejercicio);
  Future<Resource<String>> createWithImgEjercicio(
      String idDesafio, EjerciciosMultiple ejercicio, File image);
  Future<Resource<String>> deleteEjercicio(
      String idDesafio, String idEjercicio);
  Stream<Resource<List<EjerciciosMultiple>>> getEjercicios(String idDesafio);
  Future<Resource<String>> update(
      String idDesafio, EjerciciosMultiple ejercicios);
  Future<Resource<String>> updateWithImg(
      String idDesafio, EjerciciosMultiple ejercicios, File image);
}
