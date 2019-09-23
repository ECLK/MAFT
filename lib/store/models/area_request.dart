import 'package:tabulation/store/models/area_model.dart';

class AreaRequestModel {
  List<Area> areas;
  Area election;

  AreaRequestModel({
    this.areas,
    this.election,
  });

  factory AreaRequestModel.fromJson(List<dynamic> parsedJson) {
    List<Area> areas = new List<Area>();
    areas = parsedJson.map((i) => Area.fromJson(i)).toList();

    return new AreaRequestModel(areas: areas);
  }
}

// class Area {
//   int electionId;
//   int areaId;
//   String areaName;
//   String areaType;

//   Area({this.electionId, this.areaId, this.areaName, this.areaType});

//   factory Area.fromJson(Map<String, dynamic> json) {
//     return new Area(
//       electionId: json['electionId'],
//       areaId: json['areaId'],
//       areaName: json['areaName'],
//       areaType: json['areaType'],
//     );
//   }
// }
