import 'package:meta/meta.dart';
import 'package:tabulation/store/models/ballot_box_request.dart';

@immutable
class BallotBoxState {
  final List<BallotBox> ballotBoxes;

  BallotBoxState({
    @required this.ballotBoxes,
  });

  factory BallotBoxState.initial() {
    return new BallotBoxState(ballotBoxes: new List());
  }

  BallotBoxState copyWith({
    List<BallotBoxState> ballotBoxes,
  }) {
    return new BallotBoxState(ballotBoxes: ballotBoxes ?? this.ballotBoxes);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BallotBoxState &&
          runtimeType == other.runtimeType &&
          ballotBoxes == other.ballotBoxes;

  @override
  int get hashCode => ballotBoxes.hashCode;
}
