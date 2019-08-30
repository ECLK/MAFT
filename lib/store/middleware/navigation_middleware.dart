import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/auth_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/keys.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is NavigateToRegistrationAction) {
      Keys.navKey.currentState.pushNamed("/home");
    }
    next(action);
  }
}
