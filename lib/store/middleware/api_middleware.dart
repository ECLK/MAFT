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
    Map post = {
      "electionId": electionId,
      "issuedTo": officeId,
      "issuingOfficeId": issuingOfficeId,
      "receivingOfficeId": receivingOfficeId
    };

   /*  var response = await http.post(
        Uri.encodeFull("https://dev.tabulation.ecdev.opensource.lk/invoice"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: utf8.encode(json.encode(post)));

    final jsonResponse = json.decode(response.body);
    InvoiceModel invoice = InvoiceModel.fromJson(jsonResponse); */

    next(new NavigateToIssuingPvStepTwoAction());
    //next(new InvoiceResponseAction(invoice));
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
      if (ballotBook.available) {
        postInvoiceStationaryItemAction(next, invoiceId, ballotBook);
      } else {}
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
            "https://dev.tabulation.ecdev.opensource.lk/ballot-box?limit=20&electionId=${electionId}"),
        headers: {"Accept": "application/json"});

    final jsonResponse = json.decode(response.body);

    BallotBoxModel ballotBoxeModel = BallotBoxModel.fromJson(jsonResponse);
    List<BallotBox> ballotBoxes = ballotBoxeModel.ballotBoxes;

    next(new BalloBoxesResponseAction(ballotBoxes));
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
