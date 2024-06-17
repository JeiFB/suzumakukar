import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class LoginState {
  ValidationItem userName;
  ValidationItem password;
  LoginState(
      {this.userName = const ValidationItem(),
      this.password = const ValidationItem()});

  LoginState copyWith({ValidationItem? userName, ValidationItem? password}) =>
      LoginState(
          userName: userName ?? this.userName,
          password: password ?? this.password);

  bool isValid() {
    if (userName.value.isEmpty || password.value.isEmpty) {
      return false;
    }
    return true;
  }
}
