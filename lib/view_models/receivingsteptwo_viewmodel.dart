import 'package:redux/redux.dart';
import 'package:tabulation/store/app/app_state.dart';

class ReceivingStepTwoViewModel {
  final int invoiceId;

  ReceivingStepTwoViewModel(
      {this.invoiceId});

  static ReceivingStepTwoViewModel fromStore(Store<AppState> store) {
    return ReceivingStepTwoViewModel(
        // invoiceId: store.state.invoiceState.invoiceId
    );
  }
}
