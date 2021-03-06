import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';
import 'package:tabulation/view_models/receiving_viewmodel.dart';

class ReceivingStepOneForm extends StatefulWidget {
  @override
  _ReceivingStepOneFormState createState() => new _ReceivingStepOneFormState();
}

class _ReceivingStepOneFormState extends State<ReceivingStepOneForm> {
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
    return StoreConnector<AppState, ReceivingViewModel>(
      converter: (store) => ReceivingViewModel.fromStore(store),
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

  List<Widget> getFormWidget(ReceivingViewModel viewModel) {
    List<Widget> formWidgets = new List();
    List<Area> countingCenters = new List();
    List<Area> pollingStations = new List();

    if (viewModel.areas != null) {
      viewModel.areas.forEach((area) {
        if (area.areaType == "CountingCentre" && area.areaName != "") {
          countingCenters.add(area);
        } else if (area.areaType == "PollingStation") {
          pollingStations.add(area);
        }
      });

      //temp fix until Dinuka implements - sort counting centers
      countingCenters.sort(
          (a, b) => int.parse(a.areaName).compareTo(int.parse(b.areaName)));
    }

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
            padding: EdgeInsets.only(top: 15.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DropdownButton(
                    isExpanded: true,
                    items: [
                      new DropdownMenuItem(child: new Text("Counting Station"))
                    ],
                    hint: new Text("Select Station"),
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
        items: countingCenters.map((area) {
          return new DropdownMenuItem(
              value: area.areaId, child: new Text(area.areaName));
        }).toList(),
        hint: new Text("Select station"),
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
            'Received by : ',
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
        items: pollingStations.map((area) {
          return new DropdownMenuItem(
              value: area.areaId, child: new Text(area.areaName));
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
            if (viewModel.invoice.receivingOfficeId != null &&
                viewModel.invoice.issuingOfficeId != null)
              viewModel.createInvoice();
            else
              _showDialog("Please make sure the required fields are filled.");
          },
        ),
      ),
    );

//received by
    formWidgets.add(issuedTo);
    formWidgets.add(issuedFor);
    formWidgets.add(selectReceivingOffice);

    formWidgets.add(divider);
//issued by
    formWidgets.add(issuedBy);
    formWidgets.add(issuedFrom);
    formWidgets.add(selectIssuingOffice);

    formWidgets.add(btnNext);

    return formWidgets;
  }
}
