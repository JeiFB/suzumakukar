import 'package:suzumakukar/src/domain/models/desafios.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class DesafiosRepository {
  Stream<Resource<List<Desafios>>> getDesafios();
  Future<Resource<String>> createDesafios(Desafios desafio);
  Future<Resource<String>> deleteDesafios(String id);
}
