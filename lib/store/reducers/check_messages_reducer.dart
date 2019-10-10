import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/check_messages_actions.dart';
import 'package:tabulation/store/states/check_messages_state.dart';

final checkMessagesReducer = combineReducers<CheckMessagesState>([
  TypedReducer<CheckMessagesState, UpdateCountingCenterId>(
      _updateCountingCenterId),
  TypedReducer<CheckMessagesState, UpdateElectoralDistrictId>(
      _updateElectoralDistrictId),
  TypedReducer<CheckMessagesState, UpdatePollingDivisionId>(
      _updatePollingDivisionId),
  TypedReducer<CheckMessagesState, UpdatePollingStationId>(
      _updatePollingStationId),
        TypedReducer<CheckMessagesState, UpdateTime>(
      _updateTime),
        TypedReducer<CheckMessagesState, UpdateNameARO>(
      _updateNameARO),
        TypedReducer<CheckMessagesState, UpdateRemarks>(
      _updateRemarks)
]);

CheckMessagesState _updateCountingCenterId(
    CheckMessagesState state, UpdateCountingCenterId action) {
  return state.copyWith(countingCenterId: action.id);
}

CheckMessagesState _updatePollingStationId(
    CheckMessagesState state, UpdatePollingStationId action) {
  return state.copyWith(pollingStationId: action.id);
}

CheckMessagesState _updateElectoralDistrictId(
    CheckMessagesState state, UpdateElectoralDistrictId action) {
  return state.copyWith(electoralDistrictId: action.id);
}

CheckMessagesState _updatePollingDivisionId(
    CheckMessagesState state, UpdatePollingDivisionId action) {
  return state.copyWith(pollingDivisionId: action.id);
}

CheckMessagesState _updateTime(
    CheckMessagesState state, UpdateTime action) {
  return state.copyWith(time: action.time);
}

CheckMessagesState _updateNameARO(
    CheckMessagesState state, UpdateNameARO action) {
  return state.copyWith(nameARO: action.nameARO);
}
CheckMessagesState _updateRemarks(
    CheckMessagesState state, UpdateRemarks action) {
  return state.copyWith(remarks: action.remarks);
}