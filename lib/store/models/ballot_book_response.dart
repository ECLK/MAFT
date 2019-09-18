import 'package:tabulation/store/states/ballot_book_state.dart';

class BallotBookResponseModel {
  int electionId;
  bool available;
  String fromBallotId;
  String toBallotId;
  int stationaryItemId;
  int statusCode;
  bool isBallotBookActive;
  String statusCodeMessage;

  BallotBookResponseModel(
      {this.electionId,
      this.available,
      this.fromBallotId,
      this.toBallotId,
      this.stationaryItemId,
      this.statusCode,
      this.statusCodeMessage,
      this.isBallotBookActive});

  factory BallotBookResponseModel.fromJson(Map<String, dynamic> json) {
    return new BallotBookResponseModel(
      electionId: json['electionId'],
      available: json['available'],
      fromBallotId: json['fromBallotId'],
      toBallotId: json['toBallotId'],
      stationaryItemId: json['stationaryItemId'],
    );
  }

  factory BallotBookResponseModel.fromState(BallotBookState state) {
    return new BallotBookResponseModel(
        electionId: state.electionId,
        available: state.available,
        fromBallotId: state.fromBallotId,
        toBallotId: state.toBallotId,
        stationaryItemId: state.stationaryItemId,
        isBallotBookActive: state.isBallotBookActive);
  }
}
