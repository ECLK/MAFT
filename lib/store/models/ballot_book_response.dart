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
  List<BallotBookResponseModel> ballotBooks;

  BallotBookResponseModel(
      {this.electionId,
      this.available,
      this.fromBallotId,
      this.toBallotId,
      this.stationaryItemId,
      this.statusCode,
      this.statusCodeMessage,
      this.isBallotBookActive,
      this.ballotBooks});

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
        isBallotBookActive: state.isBallotBookActive,
        statusCode: state.statusCode);
  }

  factory BallotBookResponseModel.fromJsonList(List<dynamic> parsedJson) {
    List<BallotBookResponseModel> ballotBooks =
        new List<BallotBookResponseModel>();
    ballotBooks =
        parsedJson.map((i) => BallotBookResponseModel.fromJson(i)).toList();

    return new BallotBookResponseModel(ballotBooks: ballotBooks);
  }
}
