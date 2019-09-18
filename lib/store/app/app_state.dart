import 'package:meta/meta.dart';
import 'package:tabulation/store/states/auth_state.dart';
import 'package:tabulation/store/states/ballot_book_state.dart';
import 'package:tabulation/store/states/ballot_box_state.dart';
import 'package:tabulation/store/states/invoice_state.dart';
import 'package:tabulation/store/states/office_state.dart';
import 'package:tabulation/store/states/signin_state.dart';

@immutable
class AppState {
  final AuthState authState;
  final SignInState signInState;
  final OfficeState officeState;
  final InvoiceState invoiceState;
  final BallotBookState ballotBookState;
  final BallotBoxState ballotBoxState;

  AppState(
      {@required this.authState,
      @required this.signInState,
      @required this.officeState,
      @required this.invoiceState,
      @required this.ballotBookState,
      @required this.ballotBoxState});

  factory AppState.initial() {
    return AppState(
        authState: AuthState.initial(),
        signInState: SignInState.initial(),
        officeState: OfficeState.initial(),
        invoiceState: InvoiceState.initial(),
        ballotBookState: BallotBookState.initial(),
        ballotBoxState: BallotBoxState.initial());
  }

  AppState copyWith({
    AuthState authState,
    SignInState signInState,
    OfficeState officeState,
    InvoiceState invoiceState,
    BallotBookState ballotBookState,
    BallotBoxState ballotBoxState,
  }) {
    return AppState(
        authState: authState ?? this.authState,
        signInState: signInState ?? this.signInState,
        officeState: officeState ?? this.officeState,
        invoiceState: invoiceState ?? this.invoiceState,
        ballotBookState: ballotBookState ?? this.ballotBookState,
        ballotBoxState: ballotBoxState ?? this.ballotBoxState);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          authState == other.authState &&
          signInState == other.signInState &&
          officeState == other.officeState &&
          invoiceState == other.invoiceState &&
          ballotBookState == other.ballotBookState &&
          ballotBoxState == other.ballotBoxState;

  @override
  int get hashCode =>
      authState.hashCode ^
      signInState.hashCode ^
      officeState.hashCode ^
      invoiceState.hashCode ^
      ballotBookState.hashCode ^
      ballotBoxState.hashCode;
}
