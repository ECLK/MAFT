import 'package:redux/redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/ballot_box_request.dart';

class SelectBallotBoxesViewModel {
  final List<BallotBox> ballotBoxes;

  SelectBallotBoxesViewModel({this.ballotBoxes});

  static SelectBallotBoxesViewModel fromStore(Store<AppState> store) {
    return SelectBallotBoxesViewModel(
        ballotBoxes: store.state.ballotBoxState.ballotBoxes);
  }
}
