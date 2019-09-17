import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/ballot_book_actions.dart';
import 'package:tabulation/store/states/ballot_book_state.dart';

final ballotBookReducer = combineReducers<BallotBookState>([
  TypedReducer<BallotBookState, BallotBookResponseAction>(
      _ballotBookResponseAction),
  TypedReducer<BallotBookState, UpdateBallotBookStatus>(
      _updateBallotBookStatus),
  TypedReducer<BallotBookState, UpdateBallotBooks>(_updateBallotBooks),
]);

BallotBookState _ballotBookResponseAction(
    BallotBookState state, BallotBookResponseAction action) {
  return state.copyWith(
      electionId: action.ballotBook.electionId,
      available: action.ballotBook.available,
      fromBallotId: action.ballotBook.fromBallotId,
      toBallotId: action.ballotBook.toBallotId,
      stationaryItemId: action.ballotBook.stationaryItemId,
      statusCode: action.statusCode,
      statusCodeMessage: action.statusCodeMessage);
}

BallotBookState _updateBallotBookStatus(
    BallotBookState state, UpdateBallotBookStatus action) {
  return state.copyWith(isBallotBookActive: action.isBallotBookActive);
}

BallotBookState _updateBallotBooks(
    BallotBookState state, UpdateBallotBooks action) {
  return state.copyWith(
      ballotBooks: List.from(state.ballotBooks)..add(action.ballotBook),
      isBallotBookActive: false);
}
