import 'package:flutter/foundation.dart';
import 'package:suzumakukar/src/domain/models/test.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/test_%20usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class TestListViewModel extends ChangeNotifier {
  final TestUseCases _testUseCases;
  TestListViewModel(this._testUseCases);

  Stream<Resource<List<Test>>> getTest() => _testUseCases.getTest.launch();

  deleteTest(String id) async {
    await _testUseCases.deleteTest.launch(id);
    notifyListeners();
  }
}
