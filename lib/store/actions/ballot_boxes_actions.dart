import 'package:tabulation/store/models/ballot_box_request.dart';
import 'package:tabulation/store/models/ballot_box_response.dart';

class FetchBalloBoxesAction {
  int electionId;

  FetchBalloBoxesAction(this.electionId);
}

class BalloBoxesResponseAction {
  final List<BallotBox> ballotBoxes;

  BalloBoxesResponseAction(this.ballotBoxes);
}

class UpdateBallotBoxStatus {
  final bool isBallotBoxActive;

  UpdateBallotBoxStatus(this.isBallotBoxActive);
}

class PostBallotBoxAction {
  int electionId;
  int invoiceId;
  String ballotBoxId;

  PostBallotBoxAction(this.electionId, this.invoiceId, this.ballotBoxId);
}

class UpdateBallotBoxes {
  final BallotBoxResponseModel ballotBoxResponseModels;

  UpdateBallotBoxes(this.ballotBoxResponseModels);
}

class ClearBalloBoxesAction {
  ClearBalloBoxesAction();
}
