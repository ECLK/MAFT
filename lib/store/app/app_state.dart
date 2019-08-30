import 'package:meta/meta.dart';
import 'package:tabulation/store/states/auth_state.dart';
import 'package:tabulation/store/states/office_state.dart';
import 'package:tabulation/store/states/signin_state.dart';

@immutable
class AppState {
  final AuthState authState;
  final SignInState signInState;
  final OfficeState officeState;

  AppState({
    @required this.authState,
    @required this.signInState,
    @required this.officeState,
  });

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      signInState: SignInState.initial(),
      officeState: OfficeState.initial(),
    );
  }

  AppState copyWith({
    AuthState authState,
    SignInState signInState,
    OfficeState officeState,
  }) {
    return AppState(
        authState: authState ?? this.authState,
        signInState: signInState ?? this.signInState,
        officeState: officeState ?? this.officeState);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          authState == other.authState &&
          signInState == other.signInState &&
          officeState == other.officeState;

  @override
  int get hashCode =>
      authState.hashCode ^ signInState.hashCode ^ officeState.hashCode;
}
