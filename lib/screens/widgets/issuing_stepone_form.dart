import 'package:flutter/material.dart';

class IssuingStepOneForm extends StatefulWidget {
  @override
  _IssuingStepOneFormState createState() => new _IssuingStepOneFormState();
}

class _IssuingStepOneFormState extends State<IssuingStepOneForm> {
  final _formKey = GlobalKey<FormState>();
  String _selectedIssuedFrom = 'Polling Station';
  String _selectedIssuedTo = 'Counting Center';

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

    final issuedBy = new Row(
      children: <Widget>[
        new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              'Issued by :',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 0.0),
              child: new Text(
                'Pavan',
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 20.0),
              ),
            ),
          ],
        ),
        //  ),
      ],
    );

    final issuedTo = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
          child: new Text(
            'Issued to : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 20.0),
          child: new DropdownButton<String>(
            hint: Text('Select user'),
            items: <String>['User 1', 'User 2', 'User 3', 'User 4']
                .map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value) {
              print('issuedTo val: ' + value);
            },
          ),
        ),
      ],
    );

    final issuedFrom = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 0.0, left: 0.0),
          child: new Text(
            'Issued from : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 0.0, left: 20.0),
          child: new DropdownButton<String>(
            value: _selectedIssuedFrom,
            hint: Text('Select user'),
            items: <String>[
              'Election Commission',
              'District Centre',
              'Counting Center',
              'Polling Station'
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      ],
    );

    final selectPollingStation = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 0.0, left: 20.0),
          child: new DropdownButton<String>(
            hint: Text('Select Polling Station'),
            items: <String>['Colombo', 'Kandy', 'Galle', 'Kalutara']
                .map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      ],
    );

    final issuedFor = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 0.0, left: 0.0),
          child: new Text(
            'Issued for : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 0.0, left: 20.0),
          child: new DropdownButton<String>(
            value: _selectedIssuedTo,
            hint: Text('Select user'),
            items: <String>[
              'Election Commission',
              'District Centre',
              'Counting Center',
              'Polling Station'
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      ],
    );

    final selectCountingCenter = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 0.0, left: 20.0),
          child: new DropdownButton<String>(
            hint: Text('Select Counting Center'),
            items: <String>['Center A', 'Center B', 'Center C', 'Center D']
                .map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      ],
    );

    final btnNext = Padding(
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
            'Next',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            if (!_formKey.currentState.validate()) {
            } else {
              Navigator.of(context).pushNamed("/issuing-steptwo");
            }
          },
        ),
      ),
    );

    formWidgets.add(issuedBy);
    formWidgets.add(issuedTo);
    formWidgets.add(issuedFrom);
    formWidgets.add(selectPollingStation);
    formWidgets.add(issuedFor);
    formWidgets.add(selectCountingCenter);
    formWidgets.add(btnNext);

    return formWidgets;
  }
}
