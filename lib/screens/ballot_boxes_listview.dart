import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/ballot_boxes_select_viewmodel.dart';

class BallotBoxesListViewScreen extends StatefulWidget {
  @override
  _BallotBoxesListViewState createState() => new _BallotBoxesListViewState();
}

class _BallotBoxesListViewState extends State<BallotBoxesListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Select Ballot Boxe(s)"),
      ),
      body: new StoreConnector<AppState, SelectBallotBoxesViewModel>(
          converter: (store) => SelectBallotBoxesViewModel.fromStore(store),
          builder: (context, viewModel) {
            return new ListView.builder(
              itemCount: viewModel.ballotBoxes == null
                  ? 0
                  : viewModel.ballotBoxes.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  12.0, 12.0, 12.0, 6.0),
                              child: Text(
                                viewModel.ballotBoxes
                                    .elementAt(index)
                                    .ballotBoxId
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.check_box_outline_blank,
                                  size: 35.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.grey,
                    )
                  ],
                );
              },
            );
          }),
    );
  }
}
