import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/ballot_book_response.dart';
import 'package:tabulation/view_models/issuingsteptwo_viewmodel.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;

class BallotBook extends StatelessWidget {
  bool isNewBallotBook = false;

  final TextEditingController _activeBallotBookFromController =
      new TextEditingController();
  final TextEditingController _activeBallotBookToController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: new StoreConnector<AppState, IssuingStepTwoViewModel>(
              converter: (store) => IssuingStepTwoViewModel.fromStore(store),
              builder: (context, viewModel) {
                return new SizedBox(
                  width: 150,
                  child: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                        keyboardType: TextInputType.number,
                        controller: this._activeBallotBookFromController,
                        autofocus: true,
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontStyle: FontStyle.normal),
                        decoration:
                            InputDecoration(border: OutlineInputBorder())),
                    suggestionsCallback: (pattern) async {
                      return await this
                          .getBallotBookSuggestions(pattern, viewModel);
                    },
                    itemBuilder: (context, BallotBookResponseModel item) {
                      return ListTile(
                        title: Text(item.fromBallotId.toString()),
                      );
                    },
                    onSuggestionSelected: (BallotBookResponseModel item) {
                      this._activeBallotBookFromController.text =
                          item.fromBallotId.toString();
                      this._activeBallotBookToController.text =
                          item.toBallotId.toString();
                    },
                  ),
                );
              }),
        ),
        new Flexible(
          child: new StoreConnector<AppState, IssuingStepTwoViewModel>(
              converter: (store) => IssuingStepTwoViewModel.fromStore(store),
              builder: (context, viewModel) {
                new SizedBox(
                  width: 150,
                  child: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                        keyboardType: TextInputType.number,
                        controller: this._activeBallotBookToController,
                        autofocus: true,
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontStyle: FontStyle.normal),
                        decoration:
                            InputDecoration(border: OutlineInputBorder())),
                    suggestionsCallback: (pattern) async {
                      return await this
                          .getBallotBookSuggestions(pattern, viewModel);
                    },
                    itemBuilder: (context, BallotBookResponseModel item) {
                      return ListTile(
                        title: Text(item.fromBallotId.toString()),
                      );
                    },
                    onSuggestionSelected: (BallotBookResponseModel item) {
                      this._activeBallotBookFromController.text =
                          item.fromBallotId.toString();
                      this._activeBallotBookToController.text =
                          item.toBallotId.toString();
                    },
                  ),
                );
              }),
        ),
        new Flexible(
          child: new StoreConnector<AppState, IssuingStepTwoViewModel>(
              converter: (store) => IssuingStepTwoViewModel.fromStore(store),
              builder: (context, viewModel) {
                return new IconButton(
                  icon: Icon(Icons.save),
                  tooltip: 'Save Ballot Book',
                  onPressed: () {
                    this.addNewBallotBook(viewModel);
                  },
                );
              }),
        )
      ],
    );
  }

  Future<List<BallotBookResponseModel>> getBallotBookSuggestions(
      String pattern, IssuingStepTwoViewModel viewModel) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://dev.tabulation.ecdev.opensource.lk/ballot-book?electionId=${viewModel.selectedSubElection.electionId}"),
        headers: {"Accept": "application/json"});

    final jsonResponse = json.decode(response.body);

    BallotBookResponseModel ballotBookResponseModels =
        BallotBookResponseModel.fromJsonList(jsonResponse);
    List<BallotBookResponseModel> ballotBooks =
        ballotBookResponseModels.ballotBooks;

    return ballotBooks;
  }

  void addNewBallotBook(IssuingStepTwoViewModel viewModel) {
    viewModel.postBallotBook(_activeBallotBookFromController.text,
        _activeBallotBookToController.text);
  }
}
