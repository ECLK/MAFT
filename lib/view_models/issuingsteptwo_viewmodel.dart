import 'package:redux/redux.dart';
import 'package:tabulation/store/app/app_state.dart';

class IssuingStepTwoViewModel {
  final int invoiceId;

  IssuingStepTwoViewModel(
      {this.invoiceId});

  static IssuingStepTwoViewModel fromStore(Store<AppState> store) {
    return IssuingStepTwoViewModel(
        // invoiceId: store.state.invoiceState.invoiceId
    );
  }
}
