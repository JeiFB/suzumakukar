import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/testExam/test_%20usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/testPage/create/create_test_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateTestViewModel extends ChangeNotifier {
  final TestUseCases _testUseCases;

  Resource _response = Init();
  Resource get response => _response;

  CreateTestState _state = CreateTestState();
  CreateTestState get state => _state;

  CreateTestViewModel(this._testUseCases);

  createTest() async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response = await _testUseCases.createTest.launch(_state.toTest());
      notifyListeners();
    }
  }

  changeTema(String value) {
    _state = _state.copyWith(tema: ValidationItem(value: value, error: ''));
  }

  changeNameTest(String value) {
    _state = _state.copyWith(nameTest: ValidationItem(value: value, error: ''));
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = CreateTestState();
    notifyListeners();
  }
}
