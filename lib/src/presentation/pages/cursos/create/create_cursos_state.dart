import 'package:suzumakukar/src/domain/models/cursos.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateCursosState {
  String id;
  ValidationItem cursoName;

  CreateCursosState({this.id = '', this.cursoName = const ValidationItem()});

  toCurso() => Cursos(id: id, cursoName: cursoName.value);

  bool isValid() {
    if (cursoName.value.isEmpty) {
      return false;
    }
    return true;
  }

  CreateCursosState copyWith({ValidationItem? cursoName}) =>
      CreateCursosState(cursoName: cursoName ?? this.cursoName);
}
