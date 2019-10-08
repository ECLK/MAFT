import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/screens/widgets/ballot_book.dart';
import 'package:tabulation/screens/widgets/ballot_box.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/receiving_steptwo_viewmodel.dart';

class ReceivingStepTwoForm extends StatefulWidget {
  @override
  _ReceivingStepTwoFormState createState() => new _ReceivingStepTwoFormState();
}

class _ReceivingStepTwoFormState extends State<ReceivingStepTwoForm> {
  final _formKey = GlobalKey<FormState>();
  List<BallotBook> ballotBooks = new List<BallotBook>();
  List<BallotBoxWidget> ballotBoxes = new List<BallotBoxWidget>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new StoreConnector<AppState, ReceivingStepTwoViewModel>(
          onDidChange: (viewModel) {
            if (viewModel.isBallotBookActive == true &&
                viewModel.activeBallotBook.statusCodeMessage != "" &&
                viewModel.activeBallotBook.statusCode != 0 &&
                viewModel.activeBallotBook.statusCode != 201) {
              this._showDialog(viewModel.activeBallotBook.statusCodeMessage);
            }
          },
          converter: (store) => ReceivingStepTwoViewModel.fromStore(store),
          builder: (context, viewModel) {
            return new Column(
              children: getFormWidget(viewModel),
            );
          }),
    );
  }

  void _showDialog(String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message ?? ''),
      ),
    );
  }

  List<Widget> getFormWidget(ReceivingStepTwoViewModel viewModel) {
    List<Widget> widgets = new List();
    List<Widget> children = new List<Widget>();

    final ballotBooksHeading = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
            child: new Text(
              'Ballot Books',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
        new Flexible(
          child: !viewModel.isBallotBookActive
              ? IconButton(
                  icon: Icon(Icons.add_circle),
                  tooltip: 'Add Ballot Book',
                  onPressed: () {
                    this.addBallotBook(viewModel);
                  },
                )
              : IconButton(
                  icon: Icon(Icons.remove_circle),
                  tooltip: 'Remove Active Ballot Book',
                  onPressed: () {
                    this.addBallotBook(viewModel);
                  },
                ),
        ),
      ],
    );

    final ballotBoxesHeading = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: new Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
            child: new Text(
              'Ballot Boxes',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
        new Flexible(
          child: !viewModel.isBallotBoxActive
              ? IconButton(
                  icon: Icon(Icons.add_circle),
                  tooltip: 'Add Ballot Boxes',
                  onPressed: () {
                    this.addBallotBox(viewModel);
                  },
                )
              : IconButton(
                  icon: Icon(Icons.remove_circle),
                  tooltip: 'Remove Active Ballot Boxe',
                  onPressed: () {
                    this.addBallotBox(viewModel);
                  },
                ),
          // }),
        )
      ],
    );

    final noBallotBooksHeading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
            child: new Text(
              'Add your first ballot book.',
              style:
                  new TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),
            ),
          ),
        )
      ],
    );

    final noBallotBoxesHeading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
            child: new Text(
              'Add your first ballot box.',
              style:
                  new TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),
            ),
          ),
        )
      ],
    );

    final divider = Divider(
      height: 30.0,
      color: Colors.blueGrey,
    );

    final btnSubmit = Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
      child: new SizedBox(
        width: double.infinity,
        height: 60.0,
        child: new RaisedButton(
          textColor: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          color: Color.fromRGBO(72, 121, 209, 1),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            if (!_formKey.currentState.validate()) {
            } else {
              viewModel.confirmInvoice();
            }
          },
        ),
      ),
    );

    // generate the view
    children.add(ballotBooksHeading);
    children.add(SizedBox(height: 15.0));

    // add ballot books already created
    viewModel.ballotBookResponseModels.forEach((ballotBook) {
      final ballotBookRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new SizedBox(
              child: new Text(
                "Ballot book from " +
                    ballotBook.fromBallotId.toString() +
                    " to " +
                    ballotBook.toBallotId.toString(),
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 18.0),
              ),
            ),
          ),
        ],
      );

      children.add(ballotBookRow);
      children.add(SizedBox(height: 15.0));
    });

    if (viewModel.isBallotBookActive) {
      ballotBooks.forEach((ballotBook) {
        children.add(ballotBook);
      });
    } else {
      this.ballotBooks = new List<BallotBook>();
    }

    // show no ballot books header
    if (viewModel.ballotBookResponseModels.length == 0 &&
        this.ballotBooks.length == 0) {
      children.add(noBallotBooksHeading);
    }

    children.add(SizedBox(height: 15.0));
    children.add(divider);
    children.add(SizedBox(height: 15.0));
    children.add(ballotBoxesHeading);
    children.add(SizedBox(height: 15.0));

    // add ballot boxes already created
    viewModel.ballotBoxResponseModels.forEach((ballotBox) {
      final ballotBoxRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new SizedBox(
              child: new Text(
                ballotBox.ballotBoxId.toString(),
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 18.0),
              ),
            ),
          ),
        ],
      );

      children.add(ballotBoxRow);
      children.add(SizedBox(height: 15.0));
    });

    if (viewModel.isBallotBoxActive) {
      ballotBoxes.forEach((ballotBox) {
        children.add(ballotBox);
      });
    } else {
      this.ballotBoxes = new List<BallotBoxWidget>();
    }

    // show no ballot boxes header
    if (viewModel.ballotBoxResponseModels.length == 0 &&
        this.ballotBoxes.length == 0) {
      children.add(noBallotBoxesHeading);
    }

    children.add(SizedBox(height: 15.0));
    children.add(btnSubmit);

    final body = SingleChildScrollView(child: Column(children: children));

    widgets.add(body);

    return widgets;
  }

  void addBallotBook(ReceivingStepTwoViewModel viewModel) {

    if (!viewModel.isBallotBookActive) {
      viewModel.updateBallotBookStatus(true);
      setState(() {
        ballotBooks.add(BallotBook());
      });
    } else {
      setState(() {
        viewModel.updateBallotBookStatus(false);
        ballotBooks.removeLast();
      });
    }
  }

  void addBallotBox(ReceivingStepTwoViewModel viewModel) {
    if (!viewModel.isBallotBoxActive) {
      viewModel.updateBallotBoxStatus(true);
      setState(() {
        ballotBoxes.add(BallotBoxWidget());
      });
    } else {
      setState(() {
        viewModel.updateBallotBoxStatus(false);
        ballotBoxes.removeLast();
      });
    }
  }
}
