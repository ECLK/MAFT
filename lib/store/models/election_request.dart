import 'package:tabulation/store/models/election_model.dart';

class ElectionRequestModel {
  List<Election> elections;

  ElectionRequestModel({this.elections});

  factory ElectionRequestModel.fromJson(List<dynamic> parsedJson) {
    List<Election> elections = new List<Election>();
    elections = parsedJson.map((i) => Election.fromJson(i)).toList();

    return new ElectionRequestModel(elections: elections);
  }
}
