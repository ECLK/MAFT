import 'package:tabulation/store/models/ballot_box_request.dart';

class FetchBalloBoxesAction{
  int electionId;

  FetchBalloBoxesAction(this.electionId);
}

class BalloBoxesResponseAction{
  final List<BallotBox> ballotBoxes;

  BalloBoxesResponseAction(this.ballotBoxes);
}
