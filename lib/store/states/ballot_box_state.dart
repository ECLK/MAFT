import 'package:meta/meta.dart';
import 'package:tabulation/store/models/ballot_box_response.dart';

@immutable
class BallotBoxState {
  final bool isBallotBoxActive;
  final List<BallotBoxResponseModel> ballotBoxResponseModels;

  BallotBoxState({this.isBallotBoxActive, this.ballotBoxResponseModels});

  factory BallotBoxState.initial() {
    return new BallotBoxState(
        isBallotBoxActive: false, ballotBoxResponseModels: new List());
  }

  BallotBoxState copyWith(
      {bool isBallotBoxActive,
      List<BallotBoxResponseModel> ballotBoxResponseModels}) {
    return new BallotBoxState(
      isBallotBoxActive: isBallotBoxActive ?? this.isBallotBoxActive,
      ballotBoxResponseModels:
          ballotBoxResponseModels ?? this.ballotBoxResponseModels,
    );
  }
}
