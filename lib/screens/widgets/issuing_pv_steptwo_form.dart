import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/screens/widgets/ballot_book.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/issuing_pv_steptwo_viewmodel.dart';

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

    final materialType = new Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Material Type : ',
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
                  DropdownButton(
                    isExpanded: true,
                    items: [
                      new DropdownMenuItem(child: new Text("D Cover")),
                    ],
                    hint: new Text("Select a material type"),
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
            'Select the D cover : ',
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
                  DropdownButton(
                    isExpanded: true,
                    items: [
                      new DropdownMenuItem(child: new Text("D cover")),
                    ],
                    hint: new Text("Select a D cover"),
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
              Navigator.of(context).popUntil(ModalRoute.withName('/homepv'));
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
