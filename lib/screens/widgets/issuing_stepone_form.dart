import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/home_viewmodel.dart';

class IssuingStepOneForm extends StatefulWidget {
  @override
  _IssuingStepOneFormState createState() => new _IssuingStepOneFormState();
}

class _IssuingStepOneFormState extends State<IssuingStepOneForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new StoreConnector<AppState, HomeViewModel>(
          converter: (store) => HomeViewModel.fromStore(store),
          builder: (context, viewModel) {
            return new Column(
              children: getFormWidget(viewModel),
            );
          }),
    );
  }

  List<Widget> getFormWidget(HomeViewModel viewModel) {
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
              padding: EdgeInsets.only(left: 5.0, right: 0.0),
              child: new Text(
                'Pavan',
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ],
    );

    final issuedTo = new Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Issued to : ',
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
                      new DropdownMenuItem(child: new Text("Center A")),
                      new DropdownMenuItem(child: new Text("Center B")),
                    ],
                    hint: new Text("Select Counting Station"),
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final issuedFrom = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
          child: new Text(
            'Issued from : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new Container(
              padding: new EdgeInsets.only(left: 5.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DropdownButton(
                      isExpanded: true,
                      items: viewModel.offices.map((ofice) {
                        return new DropdownMenuItem(
                            value: ofice.officeId,
                            child: new Text(ofice.officeName));
                      }).toList(),
                      hint: new Text("Select Polling Station"),
                      onChanged: (value) {}),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final selectPollingStation = Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new DropdownButton(
        isExpanded: true,
        items: [
          new DropdownMenuItem(child: new Text("Abc")),
          new DropdownMenuItem(child: new Text("Xyz")),
        ],
        hint: new Text("Select City"),
        onChanged: (_) {},
      ),
    );

    final issuedFor = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
          child: Text(
            'Issued for : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new Container(
              padding: new EdgeInsets.only(left: 5.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DropdownButton(
                    isExpanded: true,
                    items: [
                      new DropdownMenuItem(child: new Text("Polling Station")),
                    ],
                    hint: new Text("Select issued for"),
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final selectCountingCenter = Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new DropdownButton(
        isExpanded: true,
        items: [
          new DropdownMenuItem(child: new Text("Center A")),
          new DropdownMenuItem(child: new Text("Center B")),
        ],
        hint: new Text("Select Counting Station"),
        onChanged: (_) {},
      ),
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
