import 'package:tabulation/store/models/office_request.dart';

class FetchOficeAllAction {
  int electionId;

  FetchOficeAllAction(this.electionId);
}

class OfficeRequestAction {
  final List<Office> offices;

  OfficeRequestAction(this.offices);
}

class UpdateElectionAction {
  final Office election;
  UpdateElectionAction(this.election);
}

class FetchElectionsAction {
  FetchElectionsAction();
}

class ElectionsResponseAction {
  final List<Office> elections;

  ElectionsResponseAction(this.elections);
}
