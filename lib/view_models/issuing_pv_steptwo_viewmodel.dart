import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/ballot_book_actions.dart';
import 'package:tabulation/store/actions/ballot_boxes_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/ballot_book_response.dart';

class IssuingStepTwoViewModel {
  final int invoiceId;
  final Function(int electionId, String ballotBookFrom, String ballotBookTo)
      postBallotBook;
  final BallotBookResponseModel activeBallotBook;
  final Function(int electionId) getBallotBoxes;
  final bool isBallotBookActive;
  final Function(bool isBallotBookActive) updateBallotBookStatus;
  final List<BallotBookResponseModel> ballotBookResponseModels;

  IssuingStepTwoViewModel(
      {this.invoiceId,
      this.postBallotBook,
      this.activeBallotBook,
      this.getBallotBoxes,
      this.isBallotBookActive,
      this.updateBallotBookStatus,
      this.ballotBookResponseModels});

  static IssuingStepTwoViewModel fromStore(Store<AppState> store) {
    return IssuingStepTwoViewModel(
        postBallotBook: (electionId, ballotBookFrom, ballotBookTo) {
          store.dispatch(new PostBallotBookAction(
              electionId,
              store.state.invoiceState.invoiceId,
              ballotBookFrom,
              ballotBookTo));
        },
        activeBallotBook: store.state.ballotBookState.getModel(),
        invoiceId: store.state.invoiceState.invoiceId,
        getBallotBoxes: (electionId) {
          store.dispatch(new FetchBalloBoxesAction(electionId));
        },
        isBallotBookActive: store.state.ballotBookState.isBallotBookActive,
        updateBallotBookStatus: (isBallotBookActive) {
          store.dispatch(new UpdateBallotBookStatus(isBallotBookActive));
        },
        ballotBookResponseModels: store.state.ballotBookState.ballotBooks);
  }
}
