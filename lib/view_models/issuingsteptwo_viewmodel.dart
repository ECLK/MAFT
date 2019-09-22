import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/ballot_book_actions.dart';
import 'package:tabulation/store/actions/ballot_boxes_actions.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/ballot_book_response.dart';
import 'package:tabulation/store/models/ballot_box_response.dart';

class IssuingStepTwoViewModel {
  final int invoiceId;
  final Function(String ballotBookFrom, String ballotBookTo) postBallotBook;
  final Function(String ballotBoxId) postBallotBox;
  final BallotBookResponseModel activeBallotBook;
  final Function getBallotBoxes;
  final bool isBallotBookActive;
  final bool isBallotBoxActive;
  final Function(bool isBallotBookActive) updateBallotBookStatus;
  final Function(bool isBallotBoxActive) updateBallotBoxStatus;
  final List<BallotBookResponseModel> ballotBookResponseModels;
  final List<BallotBoxResponseModel> ballotBoxResponseModels;
  final Function confirmInvoice;

  IssuingStepTwoViewModel(
      {this.invoiceId,
      this.postBallotBox,
      this.postBallotBook,
      this.activeBallotBook,
      this.getBallotBoxes,
      this.isBallotBookActive,
      this.isBallotBoxActive,
      this.updateBallotBookStatus,
      this.updateBallotBoxStatus,
      this.ballotBookResponseModels,
      this.ballotBoxResponseModels,
      this.confirmInvoice});

  static IssuingStepTwoViewModel fromStore(Store<AppState> store) {
    return IssuingStepTwoViewModel(
        postBallotBook: (ballotBookFrom, ballotBookTo) {
          store.dispatch(new PostBallotBookAction(
              store.state.officeState.selectedElection.electionId,
              store.state.invoiceState.invoiceId,
              ballotBookFrom,
              ballotBookTo));
        },
        postBallotBox: (ballotBoxId) {
          store.dispatch(new PostBallotBoxAction(
              store.state.officeState.selectedElection.electionId,
              store.state.invoiceState.invoiceId,
              ballotBoxId));
        },
        confirmInvoice: () {
          store.dispatch(
              new ConfirmInvoiceAction(store.state.invoiceState.invoiceId));
        },
        activeBallotBook: store.state.ballotBookState.getModel(),
        invoiceId: store.state.invoiceState.invoiceId,
        getBallotBoxes: (electionId) {
          store.dispatch(new FetchBalloBoxesAction(electionId));
        },
        isBallotBookActive: store.state.ballotBookState.isBallotBookActive,
        isBallotBoxActive: store.state.ballotBoxState.isBallotBoxActive,
        updateBallotBookStatus: (isBallotBookActive) {
          store.dispatch(new UpdateBallotBookStatus(isBallotBookActive));
        },
        updateBallotBoxStatus: (isBallotBoxActive) {
          store.dispatch(new UpdateBallotBoxStatus(isBallotBoxActive));
        },
        ballotBoxResponseModels:
            store.state.ballotBoxState.ballotBoxResponseModels,
        ballotBookResponseModels: store.state.ballotBookState.ballotBooks);
  }
}
