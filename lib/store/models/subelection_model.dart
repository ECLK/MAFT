class SubElection {
  int electionId;
  String electionName;
  String voteType;

  SubElection({this.electionId, this.electionName, this.voteType});

  factory SubElection.fromJson(Map<String, dynamic> json) {
    return new SubElection(
      electionId: json['electionId'],
      electionName: json['electionName'],
      voteType: json['voteType'],
    );
  }
}
