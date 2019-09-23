import 'package:tabulation/store/models/subelection_model.dart';

class Election {
  int electionId;
  String electionName;
  List<SubElection> subElections;

  Election({this.electionId, this.electionName, this.subElections});

  factory Election.fromJson(Map<String, dynamic> json) {
    List<dynamic> subElections = json['subElections'];

    return new Election(
        electionId: json['electionId'],
        electionName: json['electionName'],
        subElections:
            subElections.map((i) => SubElection.fromJson(i)).toList());
  }
}
