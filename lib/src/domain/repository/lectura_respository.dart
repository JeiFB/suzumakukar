import 'package:suzumakukar/src/domain/models/lectura.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class LecturaRepository {
  Future<Resource<String>> createLectura(Lectura lectura);
  Future<Resource<String>> deleteLectura(String id);
  Stream<Resource<List<Lectura>>> getLectura();
  Future<Resource<String>> update(Lectura lectura);
}
