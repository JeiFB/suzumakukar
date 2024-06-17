import 'package:suzumakukar/src/domain/repository/test_repository.dart';

class DeleteTestUseCase {
  final TestRepositoy _repositoy;
  DeleteTestUseCase(this._repositoy);

  launch(String idTest) => _repositoy.deleteTest(idTest);
}
