import 'package:flutter/material.dart';

class IssuingStepTwoForm extends StatefulWidget {
  @override
  _IssuingStepTwoFormState createState() => new _IssuingStepTwoFormState();
}

class _IssuingStepTwoFormState extends State<IssuingStepTwoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: new Column(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidgets = new List();

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
            onPressed: () {},
          ),
        )
      ],
    );

    final ballotBookRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: new SizedBox(
            width: 100,
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'From',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
        new Flexible(
          child: new SizedBox(
            width: 100,
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'To',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
        new Flexible(
          child: new SizedBox(
            width: 100,
            child: new Text(
              '0',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        new Flexible(
          child: IconButton(
            icon: Icon(Icons.close),
            tooltip: 'Close Ballot Book',
            onPressed: () {},
          ),
        )
      ],
    );

    final tenderBallotBooksHeading = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
            child: new SizedBox(
              width: 300,
              child: new Text(
                'Tender Ballot Books',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
              ),
            ),
          ),
        ),
        new Flexible(
          child: new SizedBox(
            width: 50,
            child: IconButton(
              icon: Icon(Icons.add_circle),
              tooltip: 'Add Tender Ballot Book',
              onPressed: () {},
            ),
          ),
        )
      ],
    );

    final ballotBoxesHeading = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
          child: new Text(
            'Ballot Boxes',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
      ],
    );

    final ballotBoxRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
            child: new Text(
              'Box: b-1',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
        new Flexible(
          child: IconButton(
            icon: Icon(Icons.check_box_outline_blank),
            tooltip: 'Add Ballot Book',
            onPressed: () {},
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

    final body = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ballotBooksHeading,
          SizedBox(height: 15.0),
          ballotBookRow,
          SizedBox(height: 15.0),
          divider,
          SizedBox(height: 15.0),
          tenderBallotBooksHeading,
          SizedBox(height: 15.0),
          ballotBookRow,
          SizedBox(height: 15.0),
          divider,
          SizedBox(height: 15.0),
          ballotBoxesHeading,
          SizedBox(height: 15.0),
          ballotBoxRow,
          ballotBoxRow,
          ballotBoxRow,
          SizedBox(height: 15.0),
          btnSubmit,
        ],
      ),
    );

    formWidgets.add(body);

    return formWidgets;
  }
}
