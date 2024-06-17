import 'package:flutter/material.dart';
import 'package:suzumakukar/src/domain/models/cursos.dart';
import 'package:suzumakukar/src/domain/use_cases/cursos/cursos_usecases.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';

class CursosListViewModel extends ChangeNotifier {
  final CursosUseCase _cursosUseCase;

  final _cotroller = PageController();
  get controller => _cotroller;
  CursosListViewModel(this._cursosUseCase);

  Stream<Resource<List<Cursos>>> getCursos() =>
      _cursosUseCase.getCursos.launch();

  deleteCurso(String id) async {
    await _cursosUseCase.deleteCursos.launch(id);
    notifyListeners();
  }
}
