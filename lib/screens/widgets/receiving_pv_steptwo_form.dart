import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/screens/widgets/ballot_book.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/receiving_pv_steptwo_viewmodel.dart';

class ReceivingStepTwoForm extends StatefulWidget {
  @override
  _ReceivingStepTwoFormState createState() => new _ReceivingStepTwoFormState();
}

class _ReceivingStepTwoFormState extends State<ReceivingStepTwoForm> {
  final _formKey = GlobalKey<FormState>();
  List<BallotBook> ballotBooks = new List<BallotBook>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new StoreConnector<AppState, ReceivingStepTwoViewModel>(
          onDidChange: (viewModel) {
            if (viewModel.activeBallotBook.statusCodeMessage != "" &&
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
        content: Text(message),
      ),
    );
  }

  List<Widget> getFormWidget(ReceivingStepTwoViewModel viewModel) {
    List<Widget> widgets = new List();

    final materialType = new Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'No. of marked ballots : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new Container(
              padding: new EdgeInsets.only(left: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    final selectdCovers = new Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'No. of unmarked ballots : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new Container(
              padding: new EdgeInsets.only(left: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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

    widgets.add(materialType);
    widgets.add(selectdCovers);
    widgets.add(btnSubmit);

    return widgets;
  }
}
