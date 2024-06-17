import 'package:suzumakukar/src/domain/models/test.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateTestState {
  String id;
  ValidationItem nameTest;
  ValidationItem tema;

  CreateTestState(
      {this.id = '',
      this.nameTest = const ValidationItem(),
      this.tema = const ValidationItem()});

  toTest() => Test(id: id, nameTest: nameTest.value, tema: tema.value);
  bool isValid() {
    if (nameTest.value.isEmpty || tema.value.isEmpty) {
      return false;
    }
    return true;
  }

  CreateTestState copyWith({ValidationItem? tema, ValidationItem? nameTest}) =>
      CreateTestState(
          tema: tema ?? this.tema, nameTest: nameTest ?? this.nameTest);
}
