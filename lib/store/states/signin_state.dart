import 'package:meta/meta.dart';
import 'package:tabulation/store/app/screen_state.dart';

@immutable
class SignInState{

  final ScreenState type;
  final String password;
  final String passwordError;
  final String email;
  final String emailError;
  final String code;
  final String codeError;

  SignInState({this.type, this.password, this.passwordError,
      this.email, this.emailError, this.code, this.codeError});


  SignInState copyWith({
    ScreenState type,
    String password,
    String passwordError,
    String retypePassword,
    String retypePasswordError,
    String email,
    String emailError,
    String token,
    String code,
    String codeError,
  }){
    return new SignInState(
        type: type ?? this.type,
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        email: email ?? this.email,
        emailError: emailError ?? this.emailError,
        code: code ?? this.code,
        codeError: codeError ?? this.codeError
    );
  }

  factory SignInState.initial(){
    return new SignInState(
        type: ScreenState.WELCOME,
        password: "",
        passwordError: "",
        email: "",
        emailError: "",
        code: "",
        codeError: "");

  }
}