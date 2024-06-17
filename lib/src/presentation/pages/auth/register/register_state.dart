import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/presentation/pages/utils/validation_item.dart';

class RegisterState {
  ValidationItem name;
  ValidationItem username;
  ValidationItem password;
  bool rol;
  ValidationItem confirmpassword;

  RegisterState(
      {this.name = const ValidationItem(),
      this.username = const ValidationItem(),
      this.password = const ValidationItem(),
      this.confirmpassword = const ValidationItem(),
      this.rol = false});

  toUser() => UserData(
      name: name.value,
      username: username.value,
      password: password.value,
      rol: rol);

  bool isValid() {
    if (name.value.isEmpty ||
        username.value.isEmpty ||
        password.value.isEmpty ||
        confirmpassword.value.isEmpty ||
        (password.value != confirmpassword.value)) {
      return false;
    }
    return true;
  }

  RegisterState copyWith({
    ValidationItem? name,
    ValidationItem? username,
    ValidationItem? password,
    ValidationItem? confirmpassword,
  }) =>
      RegisterState(
        name: name ?? this.name,
        username: username ?? this.username,
        password: password ?? this.password,
        confirmpassword: confirmpassword ?? this.confirmpassword,
      );
}
