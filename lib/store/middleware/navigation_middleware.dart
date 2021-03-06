import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/auth_actions.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/keys.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is NavigateToHomeAction) {
      Keys.navKey.currentState.pushNamed("/home");
    }
    if (action is NavigateToIssuingStepTwoAction) {
      Keys.navKey.currentState.pushNamed("/issuing-steptwo");
    }
    if (action is NavigateToInvoiceSuccess) {
      Keys.navKey.currentState.pushNamed("/issuing-success");
    }
    if (action is NavigateToInvoiceReceivingSuccess) {
      Keys.navKey.currentState.pushNamed("/receiving-success");
    }
    if (action is NavigateToReceivingStepTwoAction) {
      Keys.navKey.currentState.pushNamed("/receiving-steptwo");
    }
    if (action is NavigateToIssuingPvStepTwoAction) {
      Keys.navKey.currentState.pushNamed("/issuing-steptwo-pv");
    }
    if (action is NavigateToElectionAction) {
      Keys.navKey.currentState.pushNamed("/election");
    }
    if (action is NavigateToSubElectionAction) {
      Keys.navKey.currentState.pushNamed("/sub-election");
    }

    next(action);
  }
}
