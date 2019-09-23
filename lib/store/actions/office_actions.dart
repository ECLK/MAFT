import 'package:tabulation/store/models/area_model.dart';
import 'package:tabulation/store/models/election_model.dart';
// import 'package:tabulation/store/models/office_request.dart';
import 'package:tabulation/store/models/subelection_model.dart';

class FetchOficeAllAction {
  int electionId;

  FetchOficeAllAction(this.electionId);
}

class OfficeRequestAction {
  final List<Area> areas;

  OfficeRequestAction(this.areas);
}

class FetchElectionsAction {
  FetchElectionsAction();
}

class ElectionsResponseAction {
  final List<Election> elections;

  ElectionsResponseAction(this.elections);
}
