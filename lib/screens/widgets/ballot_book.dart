import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/issuingsteptwo_viewmodel.dart';
import 'package:tabulation/util/constants.dart';

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
                  width: 140,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'From',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    controller: _activeBallotBookFromController,
                  ),
                );
              }),
        ),
        new Flexible(
          child: new SizedBox(
            width: 140,
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'To',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              controller: _activeBallotBookToController,
            ),
          ),
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

  void addNewBallotBook(IssuingStepTwoViewModel viewModel) {
    viewModel.postBallotBook(
        const_election_id,
        _activeBallotBookFromController.text,
        _activeBallotBookToController.text);
  }
}
