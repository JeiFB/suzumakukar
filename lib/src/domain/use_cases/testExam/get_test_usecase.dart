import 'package:suzumakukar/src/domain/models/test.dart';
import 'package:suzumakukar/src/domain/repository/test_repository.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class GetTestUseCase {
  final TestRepositoy _repositoy;
  GetTestUseCase(this._repositoy);

  Stream<Resource<List<Test>>> launch() => _repositoy.getTest();
}
