import 'package:tabulation/store/models/office_request.dart';

class FetchOficeAllAction{
  FetchOficeAllAction();
}

class OfficeRequestAction{
  final List<Office> offices;

  OfficeRequestAction(this.offices);
}