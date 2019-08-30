import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/states/office_state.dart';

final officeReducer = combineReducers<OfficeState>([

  TypedReducer<OfficeState,OfficeRequestAction>(_officeAction),
]);

OfficeState _officeAction(OfficeState state, OfficeRequestAction action) {
  
  return new OfficeState(
    offices: action.offices,
  );
}


