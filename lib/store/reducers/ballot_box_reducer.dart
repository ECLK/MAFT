import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/ballot_boxes_actions.dart';
import 'package:tabulation/store/states/ballot_box_state.dart';

final ballotBoxReducer = combineReducers<BallotBoxState>([
  TypedReducer<BallotBoxState, UpdateBallotBoxes>(_updateBallotBoxes),
  TypedReducer<BallotBoxState, UpdateBallotBoxStatus>(_updateBallotBoxStatus),
  TypedReducer<BallotBoxState, ClearBalloBoxesAction>(_clearBalloBoxesAction),
]);

BallotBoxState _updateBallotBoxes(
    BallotBoxState state, UpdateBallotBoxes action) {
  return state.copyWith(
      ballotBoxResponseModels: List.from(state.ballotBoxResponseModels)
        ..add(action.ballotBoxResponseModels),
      isBallotBoxActive: false);
}

BallotBoxState _updateBallotBoxStatus(
    BallotBoxState state, UpdateBallotBoxStatus action) {
  return state.copyWith(isBallotBoxActive: action.isBallotBoxActive);
}

BallotBoxState _clearBalloBoxesAction(
    BallotBoxState state, ClearBalloBoxesAction action) {
  return BallotBoxState.initial();
}
