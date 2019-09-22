import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/auth_actions.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/app/screen_state.dart';
import 'package:tabulation/store/screen.dart';

class LoginViewModel {
  final ScreenState type;
  final String password;
  final String passwordError;
  final String username;
  final String usernameError;
  final Function(String) validateUsername;
  final Function(String) validatePassword;
  final Function(String email, String password) login;
  final Function clearError;
  final Function navigateToRegistration;
  final Function fetchElections;

  LoginViewModel(
      {this.type,
      this.password,
      this.passwordError,
      this.username,
      this.usernameError,
      this.validateUsername,
      this.validatePassword,
      this.login,
      this.clearError,
      this.navigateToRegistration,
      this.fetchElections});

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
        type: store.state.signInState.type,
        username: store.state.signInState.email,
        usernameError: store.state.signInState.emailError,
        password: store.state.signInState.password,
        passwordError: store.state.signInState.passwordError,
        validateUsername: (username) =>
            store.dispatch(new ValidateUsernameAction(username, Screen.SIGNIN)),
        validatePassword: (password) =>
            store.dispatch(new ValidatePasswordAction(password, Screen.SIGNIN)),
        login: (username, password) {
          store.dispatch(new ValidateLoginFields(username, password));
        },
        navigateToRegistration: () =>
            store.dispatch(new NavigateToRegistrationAction()),
        fetchElections: () => store.dispatch(new FetchElectionsAction()));
  }
}
