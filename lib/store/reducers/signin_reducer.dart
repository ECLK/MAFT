import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/auth_actions.dart';
import 'package:tabulation/store/screen.dart';
import 'package:tabulation/store/states/signin_state.dart';

final signinReducer = combineReducers<SignInState>([
  TypedReducer<SignInState,ValidateUsernameAction>(_validateEmail),
  TypedReducer<SignInState,ValidatePasswordAction>(_validatePassword),
  TypedReducer<SignInState,ValidateLoginFields>(_validateLoginFieldsAction),
  TypedReducer<SignInState,UsernameErrorAction>(_emailErrorAction),
  TypedReducer<SignInState,PasswordErrorAction>(_passwordErrorAction),
]);

SignInState _validateEmail(SignInState state, ValidateUsernameAction action){
  return state.copyWith(email: action.username);
}

SignInState _validatePassword(SignInState state, ValidatePasswordAction action) =>
    state.copyWith(password: action.password);

SignInState _validateLoginFieldsAction(SignInState state, ValidateLoginFields action) => state;

SignInState _emailErrorAction(SignInState state, UsernameErrorAction action){
  if(action.screen == Screen.SIGNIN){
    return state.copyWith(emailError: action.message);
  }else return state;
}

SignInState _passwordErrorAction(SignInState state, PasswordErrorAction action){
  if (action.screen == Screen.SIGNIN) {
    return state.copyWith(passwordError: action.message);
  }else return state;
}
