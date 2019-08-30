import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/auth_actions.dart';
import 'package:tabulation/store/screen.dart';
import 'package:tabulation/store/states/auth_state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState,ValidateUsernameAction>(_validateUsername),
  TypedReducer<AuthState,ValidatePasswordAction>(_validatePassword),
  TypedReducer<AuthState,ValidateLoginFields>(_validateLoginFieldsAction),
  TypedReducer<AuthState,UsernameErrorAction>(_emailErrorAction),
  TypedReducer<AuthState,PasswordErrorAction>(_passwordErrorAction),
]);

AuthState _validateUsername(AuthState state, ValidateUsernameAction action){
  return state.copyWith(username: action.username);
}

AuthState _validatePassword(AuthState state, ValidatePasswordAction action) =>
    state.copyWith(password: action.password);

AuthState _validateLoginFieldsAction(AuthState state, ValidateLoginFields action) => state;

AuthState _emailErrorAction(AuthState state, UsernameErrorAction action){
  if(action.screen == Screen.SIGNUP){
    return state.copyWith(usernameError: action.message);
  }else return state;
}

AuthState _passwordErrorAction(AuthState state, PasswordErrorAction action){
    if (action.screen == Screen.SIGNUP) {
      return state.copyWith(passwordError: action.message);
    }else return state;
}
