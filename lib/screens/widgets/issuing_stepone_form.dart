import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/office_request.dart';
import 'package:tabulation/view_models/issuing_viewmodel.dart';

class IssuingStepOneForm extends StatefulWidget {
  @override
  _IssuingStepOneFormState createState() => new _IssuingStepOneFormState();
}

class _IssuingStepOneFormState extends State<IssuingStepOneForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IssuingViewModel>(
      converter: (store) => IssuingViewModel.fromStore(store),
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
  void _showDialog(String message) {
     Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message),
      ),
    );
  }
  List<Widget> getFormWidget(IssuingViewModel viewModel) {
    List<Widget> formWidgets = new List();
    List<Office> countingCenters = new List();
    List<Office> pollingStations = new List();

    viewModel.offices.forEach((Office office) {
      if (office.officeType == "CountingCentre") {
        countingCenters.add(office);
      } else if (office.officeType == "PollingStation") {
        pollingStations.add(office);
      }
    });

    final issuedBy = new Row(
      children: <Widget>[
        new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 15.0),
              child: new Text(
                'Issued by :',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 0.0, top: 15.0),
              child: new Text(
                'ARO',
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ],
    );

    final issuedFrom = Row(
      children: <Widget>[
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DropdownButton(
                    isExpanded: true,
                    items: [
                      new DropdownMenuItem(child: new Text("Counting Center"))
                    ],
                    hint: new Text("Select center"),
                    onChanged: (value) {}),
              ],
            ),
          ),
        ),
      ],
    );

    final selectIssuingOffice = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
      child: new DropdownButton(
        isExpanded: true,
        items: countingCenters.map((office) {
          return new DropdownMenuItem(
              value: office.officeId, child: new Text(office.officeName));
        }).toList(),
        hint: new Text("Select center"),
        onChanged: (value) => viewModel.updateIssuingOffice(value),
        value: viewModel.invoice.issuingOfficeId,
      ),
    );

    final divider = Divider(
      height: 30.0,
      color: Colors.blueGrey,
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
            padding: EdgeInsets.only(top: 15.0),
            child: new Container(
              padding: new EdgeInsets.only(left: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DropdownButton(
                    isExpanded: true,
                    items: [
                      new DropdownMenuItem(child: new Text("SPO")),
                    ],
                    hint: new Text("Select Counting Station"),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final issuedFor = Row(
      children: <Widget>[
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0),
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
      ],
    );

    final selectReceivingOffice = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
      child: new DropdownButton(
        isExpanded: true,
        items: pollingStations.map((office) {
          return new DropdownMenuItem(
              value: office.officeId, child: new Text(office.officeName));
        }).toList(),
        hint: new Text("Select station"),
        onChanged: (value) => viewModel.updateReceivingOffice(value),
        value: viewModel.invoice.receivingOfficeId,
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
            if(viewModel.invoice.receivingOfficeId!=null && viewModel.invoice.issuingOfficeId!=null)
              viewModel.createInvoice();
            else
              _showDialog("Please make sure the required fields are filled.");
          },
        ),
      ),
    );

    formWidgets.add(issuedBy);
    formWidgets.add(issuedFrom);
    formWidgets.add(selectIssuingOffice);

    formWidgets.add(divider);

    formWidgets.add(issuedTo);
    formWidgets.add(issuedFor);
    formWidgets.add(selectReceivingOffice);
    formWidgets.add(btnNext);

    return formWidgets;
  }
}
