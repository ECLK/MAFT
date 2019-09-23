import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/auth_actions.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/states/office_state.dart';

final officeReducer = combineReducers<OfficeState>([
  TypedReducer<OfficeState, OfficeRequestAction>(_officeAction),
  TypedReducer<OfficeState, ElectionsResponseAction>(_electionsResponseAction),
  TypedReducer<OfficeState, NavigateToSubElectionAction>(
      _navigateToSubElectionAction),
  TypedReducer<OfficeState, NavigateToHomeAction>(_navigateToHomeAction),
]);

OfficeState _officeAction(OfficeState state, OfficeRequestAction action) {
  return state.copyWith(areas: action.areas);
}

OfficeState _navigateToSubElectionAction(
    OfficeState state, NavigateToSubElectionAction action) {
  return state.copyWith(selectedElection: action.election);
}

OfficeState _navigateToHomeAction(
    OfficeState state, NavigateToHomeAction action) {
  return state.copyWith(selectedSubElection: action.subElection);
}

OfficeState _electionsResponseAction(
    OfficeState state, ElectionsResponseAction action) {
  return new OfficeState(elections: action.elections);
}
