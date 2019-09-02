import 'package:meta/meta.dart';

@immutable
class AuthState {
  final String password;
  final String passwordError;
  final String retypePassword;
  final String retypePasswordError;
  final String username;
  final String usernameError;
  final String token;
  final String code;
  final String codeError;

  AuthState(
      {@required this.password,
      @required this.passwordError,
      @required this.retypePassword,
      @required this.retypePasswordError,
      @required this.username,
      @required this.usernameError,
      @required this.token,
      @required this.code,
      @required this.codeError});

  factory AuthState.initial() {
    return new AuthState(
        password: "",
        passwordError: "",
        retypePassword: "",
        retypePasswordError: "",
        username: "",
        usernameError: "",
        token: "",
        code: "",
        codeError: "");
  }

  AuthState copyWith({
    String password,
    String passwordError,
    String retypePassword,
    String retypePasswordError,
    String username,
    String usernameError,
    String token,
    String code,
    String codeError,
  }) {
    return new AuthState(
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        retypePassword: retypePassword ?? this.retypePassword,
        retypePasswordError: retypePasswordError ?? this.retypePasswordError,
        username: username ?? this.username,
        usernameError: usernameError ?? this.usernameError,
        token: token ?? this.token,
        code: code ?? this.code,
        codeError: codeError ?? this.codeError);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          password == other.password &&
          passwordError == other.passwordError &&
          retypePassword == other.retypePassword &&
          retypePasswordError == other.retypePasswordError &&
          username == other.username &&
          usernameError == other.usernameError &&
          token == other.token &&
          code == other.code &&
          codeError == other.codeError;

  @override
  int get hashCode =>
      password.hashCode ^
      passwordError.hashCode ^
      retypePassword.hashCode ^
      retypePasswordError.hashCode ^
      username.hashCode ^
      usernameError.hashCode ^
      token.hashCode ^
      code.hashCode ^
      codeError.hashCode;
}
