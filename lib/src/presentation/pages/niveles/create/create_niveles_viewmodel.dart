import 'package:flutter/foundation.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/pages/niveles/create/create_niveles_state.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class CreateNivelesViewModel extends ChangeNotifier {
  final CursosUseCase _cursosUseCase;

  CreateNivelesState _state = CreateNivelesState();
  CreateNivelesState get state => _state;

  Resource _response = Init();
  Resource get response => _response;

  CreateNivelesViewModel(this._cursosUseCase);

  createNivel(String id) async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response =
          await _cursosUseCase.createNiveles.launch(_state.toNivel(), id);
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  changeName(String value) {
    _state = _state.copyWith(nivel: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeTema(String value) {
    _state = _state.copyWith(tema: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = CreateNivelesState();
    notifyListeners();
  }
}
