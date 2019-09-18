import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/screens/widgets/ballot_book.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/issuingsteptwo_viewmodel.dart';

class IssuingStepTwoForm extends StatefulWidget {
  @override
  _IssuingStepTwoFormState createState() => new _IssuingStepTwoFormState();
}

// to do
// POSt /ballot-book for from and to click on CHECK
// and /invoice/{invoiceId}/stationary-item when click on SAVE
// for ballot boxes get all using /ballot-box
// then for each /ballot-box POST it to /invoice/{invoiceId}/stationary-item

class _IssuingStepTwoFormState extends State<IssuingStepTwoForm> {
  final _formKey = GlobalKey<FormState>();
  List<BallotBook> ballotBooks = new List<BallotBook>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new StoreConnector<AppState, IssuingStepTwoViewModel>(
          onDidChange: (viewModel) {
            if (viewModel.activeBallotBook.statusCodeMessage != "" &&
                viewModel.activeBallotBook.statusCode != 0 &&
                viewModel.activeBallotBook.statusCode != 201) {
              this._showDialog(viewModel.activeBallotBook.statusCodeMessage);
            }
          },
          converter: (store) => IssuingStepTwoViewModel.fromStore(store),
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
        content: Text(message),
      ),
    );
  }

  List<Widget> getFormWidget(IssuingStepTwoViewModel viewModel) {
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
          child: IconButton(
            icon: Icon(Icons.add_circle),
            tooltip: 'Add Ballot Book',
            onPressed: () {
              this.addBallotBook(viewModel);
            },
          ),
        )
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
          child: new StoreConnector<AppState, IssuingStepTwoViewModel>(
              converter: (store) => IssuingStepTwoViewModel.fromStore(store),
              builder: (context, viewModel) {
                return new IconButton(
                  icon: Icon(Icons.add_circle),
                  tooltip: 'Add Ballot Boxes',
                  onPressed: () {
                    this.selectBallotboxes(viewModel);
                  },
                );
              }),
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
              Navigator.of(context).popUntil(ModalRoute.withName('/home'));
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
    children.add(noBallotBoxesHeading);
    children.add(SizedBox(height: 15.0));
    children.add(btnSubmit);

    final body = SingleChildScrollView(child: Column(children: children));

    widgets.add(body);

    return widgets;
  }

  void addBallotBook(IssuingStepTwoViewModel viewModel) {
    if (!viewModel.isBallotBookActive) {
      viewModel.updateBallotBookStatus(true);
      setState(() {
        ballotBooks.add(BallotBook());
      });
    }
  }

  void selectBallotboxes(IssuingStepTwoViewModel viewModel) {
    viewModel.getBallotBoxes(2);
    Navigator.of(context).pushNamed("/select-ballot-boxes");
  }
}
