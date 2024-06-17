import 'package:suzumakukar/src/domain/models/test.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

abstract class TestRepositoy {
  Stream<Resource<List<Test>>> getTest();
  Future<Resource<String>> createTest(Test test);
  Future<Resource<String>> deleteTest(String idTest);
}
