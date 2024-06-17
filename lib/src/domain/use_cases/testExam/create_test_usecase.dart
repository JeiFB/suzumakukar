import 'package:suzumakukar/src/domain/models/test.dart';
import 'package:suzumakukar/src/domain/repository/test_repository.dart';

class CreateTestUseCase {
  final TestRepositoy _repositoy;
  CreateTestUseCase(this._repositoy);

  launch(Test test) => _repositoy.createTest(test);
}
