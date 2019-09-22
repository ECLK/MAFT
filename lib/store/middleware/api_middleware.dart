import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/ballot_book_actions.dart';
import 'package:tabulation/store/actions/ballot_boxes_actions.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/ballot_book_response.dart';
import 'package:tabulation/store/models/ballot_box_request.dart';
import 'package:tabulation/store/models/ballot_box_response.dart';
import 'package:tabulation/store/models/invoice_response.dart';
import 'package:tabulation/store/models/office_request.dart';
import 'package:tabulation/util/constants.dart';

class APIMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is FetchOficeAllAction) {
      getOffices(next);
    }
    if (action is PostInvoiceAction) {
      postInvoice(next, action.electionId, action.issuedToId,
          action.issuingOfficeId, action.receivingOfficeId);
    }
    if (action is PostInvoiceActionPv) {
      postInvoicePv(next, action.electionId, action.issuedToId,
          action.issuingOfficeId, action.receivingOfficeId);
    }
    if (action is PostInvoiceReceivingAction) {
      postInvoiceReceiving(next, action.electionId, action.issuedToId,
          action.issuingOfficeId, action.receivingOfficeId);
    }

    if (action is PostBallotBookAction) {
      postBallotBook(next, action.electionId, action.invoiceId,
          action.ballotBookFrom, action.ballotBookTo);
    }

    if (action is FetchBalloBoxesAction) {
      getBallotBoxes(next, action.electionId);
    }
    if (action is PostBallotBoxAction) {
      postBallotBox(
          next, action.electionId, action.invoiceId, action.ballotBoxId);
    }
    if (action is ConfirmInvoiceAction) {
      confirmInvoice(next, action.invoiceId);
    }

    next(action);
  }

  void getOffices(NextDispatcher next) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://dev.tabulation.ecdev.opensource.lk/office?electionId=${const_election_id}"),
        headers: {"Accept": "application/json"});

    final jsonResponse = json.decode(response.body);

    OfficeRequestModel officesList = OfficeRequestModel.fromJson(jsonResponse);
    List<Office> offices = officesList.photos;

    next(new OfficeRequestAction(offices));
  }

  void postInvoice(NextDispatcher next, int electionId, int officeId,
      int issuingOfficeId, int receivingOfficeId) async {
    Map post = {
      "electionId": electionId,
      "issuedTo": officeId,
      "issuingOfficeId": issuingOfficeId,
      "receivingOfficeId": receivingOfficeId
    };

    var response = await http.post(
        Uri.encodeFull("https://dev.tabulation.ecdev.opensource.lk/invoice"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: utf8.encode(json.encode(post)));

    final jsonResponse = json.decode(response.body);
    InvoiceModel invoice = InvoiceModel.fromJson(jsonResponse);

    next(new NavigateToIssuingStepTwoAction());
    next(new InvoiceResponseAction(invoice));
  }

  void postInvoicePv(NextDispatcher next, int electionId, int officeId,
      int issuingOfficeId, int receivingOfficeId) async {
    next(new NavigateToIssuingPvStepTwoAction());
  }

  void postBallotBook(NextDispatcher next, int electionId, int invoiceId,
      String ballotBookFrom, String ballotBookTo) async {
    Map post = {
      "electionId": electionId,
      "fromBallotId": ballotBookFrom,
      "toBallotId": ballotBookTo
    };

    var response = await http.post(
        Uri.encodeFull(
            "https://dev.tabulation.ecdev.opensource.lk/ballot-book"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: utf8.encode(json.encode(post)));

    final jsonResponse = json.decode(response.body);

    BallotBookResponseModel ballotBook =
        BallotBookResponseModel.fromJson(jsonResponse);

    if (jsonResponse['status'] == 404) {
      next(new BallotBookResponseAction(
          ballotBook, 404, jsonResponse['detail']));
    } else {
      postInvoiceStationaryItemAction(next, invoiceId, ballotBook);
    }
  }

  void postInvoiceStationaryItemAction(NextDispatcher next, int invoiceId,
      BallotBookResponseModel ballotBook) async {
    Map post = {"stationaryItemId": ballotBook.stationaryItemId};

    var response = await http.post(
        Uri.encodeFull(
            "https://dev.tabulation.ecdev.opensource.lk/invoice/${invoiceId}/stationary-item"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: utf8.encode(json.encode(post)));

    if (response.statusCode == 201) {
      ballotBook.statusCode = 201;
      next(new UpdateBallotBooks(ballotBook));
    } else {}
  }

  void getBallotBoxes(NextDispatcher next, int electionId) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://dev.tabulation.ecdev.opensource.lk/ballot-box?electionId=${electionId}"),
        headers: {"Accept": "application/json"});

    final jsonResponse = json.decode(response.body);

    BallotBoxModel ballotBoxeModel = BallotBoxModel.fromJson(jsonResponse);
    List<BallotBox> ballotBoxes = ballotBoxeModel.ballotBoxes;

    next(new BalloBoxesResponseAction(ballotBoxes));
  }
}

void postBallotBox(NextDispatcher next, int electionId, int invoiceId,
    String ballotBoxId) async {
  Map post = {"electionId": electionId, "ballotBoxId": ballotBoxId};

  var response = await http.post(
      Uri.encodeFull("https://dev.tabulation.ecdev.opensource.lk/ballot-box"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: utf8.encode(json.encode(post)));

  final jsonResponse = json.decode(response.body);

  if (response.statusCode != 404) {
    postBallotBoxStationaryItemAction(
        next, invoiceId, jsonResponse['stationaryItemId'], ballotBoxId);
  }
}

void postInvoiceReceiving(NextDispatcher next, int electionId, int officeId,
    int issuingOfficeId, int receivingOfficeId) async {
  Map post = {
    "electionId": electionId,
    "issuedTo": officeId,
    "issuingOfficeId": issuingOfficeId,
    "receivingOfficeId": receivingOfficeId
  };

  var response = await http.post(
      Uri.encodeFull("https://dev.tabulation.ecdev.opensource.lk/invoice"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: utf8.encode(json.encode(post)));

  final jsonResponse = json.decode(response.body);

  InvoiceModel invoice = InvoiceModel.fromJson(jsonResponse);

  next(new NavigateToReceivingStepTwoAction());
  next(new InvoiceResponseAction(invoice));
}

void postBallotBoxStationaryItemAction(NextDispatcher next, int invoiceId,
    int stationaryItemId, String ballotBoxId) async {
  Map post = {"stationaryItemId": stationaryItemId};

  var response = await http.post(
      Uri.encodeFull(
          "https://dev.tabulation.ecdev.opensource.lk/invoice/${invoiceId}/stationary-item"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: utf8.encode(json.encode(post)));

  final jsonResponse = json.decode(response.body);

  if (response.statusCode == 201) {
    BallotBoxResponseModel ballotBox =
        BallotBoxResponseModel.fromJson(jsonResponse);
    ballotBox.statusCode = response.statusCode;
    ballotBox.ballotBoxId = ballotBoxId;

    next(new UpdateBallotBoxes(ballotBox));
  }
}

void confirmInvoice(NextDispatcher next, int invoiceId) async {
  var response = await http.put(
      Uri.encodeFull(
          "https://dev.tabulation.ecdev.opensource.lk/invoice/${invoiceId}/confirm"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      });

  final jsonResponse = json.decode(response.body);

  if (response.statusCode == 200) {
    next(new NavigateToInvoiceSuccess());
  }
}
