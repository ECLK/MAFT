import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/office_request.dart';

class APIMiddleware extends MiddlewareClass<AppState> {
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is FetchOficeAllAction) {
      getOffices(next);
    }
    next(action);
  }

  void getOffices(NextDispatcher next) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://dev.tabulation.ecdev.opensource.lk/office?offset=0&electionId=1"),
        headers: {"Accept": "application/json"});

    final jsonResponse = json.decode(response.body);

    OfficeRequestModel officesList = OfficeRequestModel.fromJson(jsonResponse);
    List<Office> offices = officesList.photos;

    next(new OfficeRequestAction(offices));
  }
}
