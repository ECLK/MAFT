import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/ballot_book_actions.dart';
import 'package:tabulation/store/actions/ballot_boxes_actions.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/app/app_state.dart';

class IssuingSuccessViewModel {
  final Function clearInvoice;
  final Function clearBallotBooks;
  final Function clearBallotBoxes;

  IssuingSuccessViewModel(
      {this.clearInvoice, this.clearBallotBooks, this.clearBallotBoxes});

  static IssuingSuccessViewModel fromStore(Store<AppState> store) {
    return IssuingSuccessViewModel(clearInvoice: () {
      store.dispatch(new ClearInvoiceAction());
    }, clearBallotBooks: () {
      store.dispatch(new ClearBalloBooksAction());
    }, clearBallotBoxes: () {
      store.dispatch(new ClearBalloBoxesAction());
    });
  }
}
