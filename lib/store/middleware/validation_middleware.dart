import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/auth_actions.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/screen.dart';
import 'package:tabulation/util/strings.dart';

class ValidationMiddleware extends MiddlewareClass<AppState> {
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is ValidateLoginFields) {
      validateEmail(Screen.SIGNIN, action.username, next);
      validatePassword(Screen.SIGNIN, action.password, next);

      next(new NavigateToElectionAction());
    }

    next(action);
  }

  void validatePassword(Screen screen, String password, NextDispatcher next) {
    if (password.length < 6) {
      next(new PasswordErrorAction(password_error, screen));
    } else {
      next(new PasswordErrorAction("", screen));
    }
  }

  void validateEmail(Screen screen, String email, NextDispatcher next) {
    RegExp exp = new RegExp(emailPattern);
    if (!exp.hasMatch(email)) {
      next(new UsernameErrorAction(email_error, screen));
    } else {
      next(new UsernameErrorAction("", screen));
    }
  }
}
