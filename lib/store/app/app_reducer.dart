import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/reducers/auth_reducer.dart';
import 'package:tabulation/store/reducers/ballot_book_reducer.dart';
import 'package:tabulation/store/reducers/ballot_boxes_reducer.dart';
import 'package:tabulation/store/reducers/invoice_reducer.dart';
import 'package:tabulation/store/reducers/office_reducer.dart';
import 'package:tabulation/store/reducers/signin_reducer.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
      authState: authReducer(state.authState, action),
      signInState: signinReducer(state.signInState, action),
      officeState: officeReducer(state.officeState, action),
      invoiceState: invoiceReducer(state.invoiceState, action),
      ballotBookState: ballotBookReducer(state.ballotBookState, action),
      ballotBoxState: ballotBoxReducer(state.ballotBoxState, action),
    );
