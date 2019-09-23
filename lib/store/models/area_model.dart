class Area {
  int electionId;
  int areaId;
  String areaName;
  String areaType;

  Area({this.electionId, this.areaId, this.areaName, this.areaType});

  factory Area.fromJson(Map<String, dynamic> json) {
    return new Area(
      electionId: json['electionId'],
      areaId: json['areaId'],
      areaName: json['areaName'],
      areaType: json['areaType'],
    );
  }
}
