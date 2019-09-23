// import 'package:tabulation/screens/sub-election.dart';
import 'package:tabulation/store/models/election_model.dart';
import 'package:tabulation/store/models/subelection_model.dart';
import 'package:tabulation/store/screen.dart';

class ValidateUsernameAction {
  final String username;
  final Screen screen;
  ValidateUsernameAction(this.username, this.screen);
}

class ValidatePasswordAction {
  final String password;
  final Screen screen;
  ValidatePasswordAction(this.password, this.screen);
}

class ValidateLoginFields {
  final String username;
  final String password;

  ValidateLoginFields(this.username, this.password);
}

class UsernameErrorAction {
  final String message;
  final Screen screen;
  UsernameErrorAction(this.message, this.screen);
}

class PasswordErrorAction {
  final String message;
  final Screen screen;
  PasswordErrorAction(this.message, this.screen);
}

class NavigateToHomeAction {
  final SubElection subElection;
  NavigateToHomeAction(this.subElection);
}

class NavigateToElectionAction {}

class NavigateToSubElectionAction {
  final Election election;
  NavigateToSubElectionAction(this.election);
}
