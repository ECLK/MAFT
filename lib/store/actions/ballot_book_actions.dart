import 'package:tabulation/store/models/ballot_book_response.dart';

class BallotBookAction {
  int electionId;
  int ballotBookFrom;
  int ballotBookTo;

  BallotBookAction(this.electionId, this.ballotBookFrom, this.ballotBookTo);
}

class PostBallotBookAction {
  int electionId;
  int invoiceId;
  String ballotBookFrom;
  String ballotBookTo;

  PostBallotBookAction(
      this.electionId, this.invoiceId, this.ballotBookFrom, this.ballotBookTo);
}

class BallotBookResponseAction {
  final BallotBookResponseModel ballotBook;
  final int statusCode;
  final String statusCodeMessage;

  BallotBookResponseAction(
      this.ballotBook, this.statusCode, this.statusCodeMessage);
}

class UpdateBallotBookStatus {
  final bool isBallotBookActive;

  UpdateBallotBookStatus(this.isBallotBookActive);
}

class UpdateBallotBooks {
  final BallotBookResponseModel ballotBook;

  UpdateBallotBooks(this.ballotBook);
}
