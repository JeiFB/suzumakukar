import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';
import 'package:suzumakukar/src/presentation/pages/cursos/create/create_cursos_state.dart';

class CreateCursosViewModel extends ChangeNotifier {
  final CursosUseCase _cursosUseCase;

  CreateCursosState _state = CreateCursosState();
  CreateCursosState get state => _state;

  Resource _response = Init();
  Resource get response => _response;

  CreateCursosViewModel(this._cursosUseCase);

  createCurso() async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response = await _cursosUseCase.createCursos.launch(_state.toCurso());
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  changeName(String value) {
    _state =
        _state.copyWith(cursoName: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = CreateCursosState();
    notifyListeners();
  }
}
