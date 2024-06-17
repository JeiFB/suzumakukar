import 'package:suzumakukar/src/domain/use_cases/testExam/create_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/delete_test_usecase.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/get_test_usecase.dart';

class TestUseCases {
  CreateTestUseCase createTest;
  DeleteTestUseCase deleteTest;
  GetTestUseCase getTest;

  TestUseCases(
      {required this.createTest,
      required this.deleteTest,
      required this.getTest});
}
