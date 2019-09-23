import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/office_request.dart';
import 'package:tabulation/view_models/issuing_pv_viewmodel.dart';

class IssuingStepOneForm extends StatefulWidget {
  @override
  _IssuingStepOneFormState createState() => new _IssuingStepOneFormState();
}

class _IssuingStepOneFormState extends State<IssuingStepOneForm> {
  final _formKey = GlobalKey<FormState>();
  void _showDialog(String message) {
     Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IssuingPvViewModel>(
      converter: (store) => IssuingPvViewModel.fromStore(store),
      builder: (context, viewModel) {
        return new Form(
          key: _formKey,
          child: new Column(
            children: getFormWidget(viewModel),
          ),
        );
      },
    );
  }

  List<Widget> getFormWidget(IssuingPvViewModel viewModel) {
    List<Widget> formWidgets = new List();
    List<Office> countingCenters = new List();

    viewModel.offices.forEach((Office office) {
      if (office.officeType == "CountingCentre") {
        countingCenters.add(office);
      }
    });

    final issuedBy = new Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: Text(
            'Issued By : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: new Container(
              padding: new EdgeInsets.only(left: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text(
                    'ARO PV',
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final district = new Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 33.0),
          child: Text(
            'District : ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 33.0),
            child: new Container(
              padding: new EdgeInsets.only(left: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DropdownButton(
                    isExpanded: true,
                    items: [
                      new DropdownMenuItem(child: new Text("Kegalle")),
                    ],
                    hint: new Text("Select a district"),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final countingCenter = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
          child: new Text(
            'Counting Center : ',
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
                        new DropdownMenuItem(child: new Text("Counting Center"))
                      ],
                      hint: new Text("Select Station"),
                      onChanged: (value) {}),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final organization = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
          child: Text(
            'Organization : ',
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
                      new DropdownMenuItem(child: new Text("Organization")),
                    ],
                    hint: new Text("Select organization"),
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
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
            viewModel.createInvoice();
          },
        ),
      ),
    );

    formWidgets.add(issuedBy);
    formWidgets.add(district);
    formWidgets.add(countingCenter);
    formWidgets.add(organization);

    formWidgets.add(btnNext);

    return formWidgets;
  }
}
