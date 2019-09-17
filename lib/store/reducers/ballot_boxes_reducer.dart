import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/ballot_boxes_actions.dart';
import 'package:tabulation/store/states/ballot_box_state.dart';

final ballotBoxReducer = combineReducers<BallotBoxState>([
  TypedReducer<BallotBoxState, BalloBoxesResponseAction>(
      _updateBallotBoxesAction),
]);

BallotBoxState _updateBallotBoxesAction(
    BallotBoxState state, BalloBoxesResponseAction action) {
  return new BallotBoxState(
    ballotBoxes: action.ballotBoxes,
  );
}
