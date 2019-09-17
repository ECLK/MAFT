import 'package:meta/meta.dart';
import 'package:tabulation/store/models/ballot_book_response.dart';
import 'package:tabulation/util/constants.dart';

@immutable
class BallotBookState {
  final int electionId;
  final bool available;
  final String fromBallotId;
  final String toBallotId;
  final int stationaryItemId;
  final int statusCode;
  final String statusCodeMessage;
  final bool isBallotBookActive;
  final List<BallotBookResponseModel> ballotBooks;

  BallotBookState(
      {this.electionId,
      this.available,
      this.fromBallotId,
      this.toBallotId,
      this.stationaryItemId,
      this.statusCode,
      this.isBallotBookActive,
      this.ballotBooks,
      this.statusCodeMessage});

  BallotBookState copyWith(
      {int electionId,
      bool available,
      String fromBallotId,
      String toBallotId,
      int stationaryItemId,
      int statusCode,
      String statusCodeMessage,
      bool isBallotBookActive,
      List<BallotBookResponseModel> ballotBooks}) {
    return new BallotBookState(
        electionId: electionId ?? this.electionId,
        available: available ?? this.available,
        fromBallotId: fromBallotId ?? this.fromBallotId,
        toBallotId: toBallotId ?? this.toBallotId,
        stationaryItemId: stationaryItemId ?? this.stationaryItemId,
        statusCode: statusCode ?? this.statusCode,
        statusCodeMessage: statusCodeMessage ?? statusCodeMessage,
        isBallotBookActive: isBallotBookActive ?? this.isBallotBookActive,
        ballotBooks: ballotBooks ?? this.ballotBooks);
  }

  factory BallotBookState.initial() {
    return new BallotBookState(
        electionId: const_election_id,
        available: false,
        fromBallotId: "",
        toBallotId: "",
        stationaryItemId: 0,
        statusCode: 0,
        statusCodeMessage: "",
        isBallotBookActive: false,
        ballotBooks: new List());
  }

  BallotBookResponseModel getModel() {
    return new BallotBookResponseModel(
        electionId: this.electionId,
        available: this.available,
        fromBallotId: this.fromBallotId,
        toBallotId: this.toBallotId,
        stationaryItemId: this.stationaryItemId,
        statusCode: this.statusCode,
        statusCodeMessage: this.statusCodeMessage,
        isBallotBookActive: this.isBallotBookActive);
  }
}
