class BallotBoxModel {
  List<BallotBox> ballotBoxes;

  BallotBoxModel({
    this.ballotBoxes,
  });

  factory BallotBoxModel.fromJson(List<dynamic> parsedJson) {
    List<BallotBox> ballotBoxes = new List<BallotBox>();
    ballotBoxes = parsedJson.map((i) => BallotBox.fromJson(i)).toList();

    return new BallotBoxModel(ballotBoxes: ballotBoxes);
  }
}

class BallotBox {
  bool available;
  String ballotBoxId;
  int electionId;
  int stationaryItemId;

  BallotBox(
      {this.available,
      this.ballotBoxId,
      this.electionId,
      this.stationaryItemId});

  factory BallotBox.fromJson(Map<String, dynamic> json) {
    return new BallotBox(
      available: json['available'],
      ballotBoxId: json['ballotBoxId'],
      electionId: json['electionId'],
      stationaryItemId: json['stationaryItemId'],
    );
  }
}
