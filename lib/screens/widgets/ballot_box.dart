import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/ballot_box_request.dart';
import 'package:tabulation/view_models/issuingsteptwo_viewmodel.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;

class BallotBoxWidget extends StatelessWidget {
  bool isNewBallotBox = false;

  final TextEditingController _activeBallotBoxFromController =
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
                  width: 260,
                  child: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                        keyboardType: TextInputType.number,
                        controller: this._activeBallotBoxFromController,
                        autofocus: true,
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontStyle: FontStyle.normal),
                        decoration:
                            InputDecoration(border: OutlineInputBorder())),
                    suggestionsCallback: (pattern) async {
                      return await this
                          .getBallotBoxSuggestions(pattern, viewModel);
                    },
                    itemBuilder: (context, BallotBox item) {
                      return ListTile(
                        title: Text(item.ballotBoxId.toString()),
                      );
                    },
                    onSuggestionSelected: (BallotBox item) {
                      this._activeBallotBoxFromController.text =
                          item.ballotBoxId.toString();
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
                    this.addNewBallotBox(viewModel);
                  },
                );
              }),
        )
      ],
    );
  }

  Future<List<BallotBox>> getBallotBoxSuggestions(
      String pattern, IssuingStepTwoViewModel viewModel) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://dev.tabulation.ecdev.opensource.lk/ballot-box?limit=20&electionId=${viewModel.selectedSubElection.electionId}&ballotBoxId=%${pattern}%"),
        headers: {"Accept": "application/json"});

    final jsonResponse = json.decode(response.body);

    BallotBoxModel ballotBoxModel = BallotBoxModel.fromJson(jsonResponse);
    List<BallotBox> ballotBoxes = ballotBoxModel.ballotBoxes;

    return ballotBoxes;
  }

  void addNewBallotBox(IssuingStepTwoViewModel viewModel) {
    viewModel.postBallotBox(_activeBallotBoxFromController.text);
  }
}
