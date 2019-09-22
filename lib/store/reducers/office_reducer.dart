import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/states/office_state.dart';

final officeReducer = combineReducers<OfficeState>([
  TypedReducer<OfficeState, OfficeRequestAction>(_officeAction),
  TypedReducer<OfficeState, UpdateElectionAction>(_updateElectionAction),
  TypedReducer<OfficeState, ElectionsResponseAction>(_electionsResponseAction),
]);

OfficeState _officeAction(OfficeState state, OfficeRequestAction action) {
  return state.copyWith(offices: action.offices);
}

OfficeState _updateElectionAction(
    OfficeState state, UpdateElectionAction action) {
  return state.copyWith(selectedElection: action.election);
}

OfficeState _electionsResponseAction(
    OfficeState state, ElectionsResponseAction action) {
  return new OfficeState(elections: action.elections);
}
