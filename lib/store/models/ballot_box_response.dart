import 'package:tabulation/store/states/ballot_box_state.dart';

class BallotBoxResponseModel {
  int electionId;
  bool available;
  int stationaryItemId;
  int statusCode;
  bool isBallotBoxActive;
  String statusCodeMessage;
  List<BallotBoxResponseModel> ballotBoxes;
  String ballotBoxId;

  BallotBoxResponseModel(
      {this.electionId,
      this.available,
      this.stationaryItemId,
      this.statusCode,
      this.statusCodeMessage,
      this.isBallotBoxActive,
      this.ballotBoxes,
      this.ballotBoxId});

  factory BallotBoxResponseModel.fromJson(Map<String, dynamic> json) {
    return new BallotBoxResponseModel(
      electionId: json['electionId'],
      available: json['available'],
      stationaryItemId: json['stationaryItemId'],
    );
  }

  factory BallotBoxResponseModel.fromState(BallotBoxState state) {
    return new BallotBoxResponseModel(
        ballotBoxes: state.ballotBoxResponseModels,
        isBallotBoxActive: state.isBallotBoxActive);
  }
}
