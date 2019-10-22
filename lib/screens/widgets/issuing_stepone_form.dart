import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';
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
    List<Area> countingCenters = new List();
    List<Area> pollingStations = new List();
    List<Area> electroralDistrict = new List();
    List<Area> pollingDivision = new List();

    if (viewModel.areas != null) {
      viewModel.areas.forEach((area) {
        if (area.areaType == "CountingCentre" && area.areaName != "") {
          countingCenters.add(area);
        } else if (area.areaType == "PollingStation") {
          pollingStations.add(area);
        } else if (area.areaType == "ElectoralDistrict") {
          electroralDistrict.add(area);
        } else if (area.areaType == "PollingDivision") {
          pollingDivision.add(area);
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
                'Issuing ARO',
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ],
    );

    final selectElectoralDistrict = Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: new DropdownButton(
        isExpanded: true,
        items: electroralDistrict.map((area) {
          return new DropdownMenuItem(
              value: area.areaId, child: new Text(area.areaName));
        }).toList(),
        hint: new Text("Select a district"),
        onChanged: (value) => viewModel.updateIssuingDistrictId(value),
        value: viewModel.invoice.issuingDistrictId,
      ),
    );

    final selectPollingDivision = Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: new DropdownButton(
        isExpanded: true,
        items: pollingDivision.map((area) {
          return new DropdownMenuItem(
              value: area.areaId,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(area.areaId.toString()),
                    Text(area.areaName)
                  ]));
        }).toList(),
        hint: new Text("Select a Polling Division"),
        onChanged: (value) => viewModel.updateIssuingPollingDivisionId(value),
        value: viewModel.invoice.issuingPollingDivisionId,
      ),
    );

    final selectreceivingDistrict = Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: new DropdownButton(
        isExpanded: true,
        items: electroralDistrict.map((area) {
          return new DropdownMenuItem(
              value: area.areaId, child: new Text(area.areaName));
        }).toList(),
        hint: new Text("Select a district"),
        onChanged: (value) => viewModel.updateReceivingDistrictId(value),
        value: viewModel.invoice.receivingDistrictId,
      ),
    );

    final selectIssuingOffice = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
      child: new DropdownButton(
        isExpanded: true,
        items: countingCenters.map((area) {
          return new DropdownMenuItem(
              value: area.areaId, child: new Text(area.areaName));
        }).toList(),
        hint: new Text("Select an I/R Center"),
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
                    hint: new Text("Select issuer"),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    final selectReceivingPollingDivision = Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: new DropdownButton(
        isExpanded: true,
        items: pollingDivision.map((area) {
          return new DropdownMenuItem(
              value: area.areaId,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(area.areaId.toString()),
                    Text(area.areaName)
                  ]));
        }).toList(),
        hint: new Text("Select a Polling Division"),
        onChanged: (value) => viewModel.updateReceivingPollingDivisionId(value),
        value: viewModel.invoice.receivingPollingDivisionId,
      ),
    );
    final selectReceivingPollingStation = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
      child: new DropdownButton(
        isExpanded: true,
        items: pollingStations.map((area) {
          return new DropdownMenuItem(
              value: area.areaId,
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(area.areaId.toString()),
                    Text(
                      area.areaName,
                      style: new TextStyle(fontSize: 12.0),
                      overflow: TextOverflow.ellipsis,
                    )
                  ]));
        }).toList(),
        hint: new Text("Select a polling station"),
        onChanged: (value) => viewModel.updateReceivingPollingStationId(value),
        value: viewModel.invoice.receivingPollingStationId,
      ),
    );

    final selectReceivingOffice = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
      child: new DropdownButton(
        isExpanded: true,
        items: countingCenters.map((area) {
          return new DropdownMenuItem(
              value: area.areaId, child: new Text(area.areaName));
        }).toList(),
        hint: new Text("Select an I/R Center"),
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

    formWidgets.add(issuedBy);
    formWidgets.add(selectElectoralDistrict);
    formWidgets.add(selectPollingDivision);
    formWidgets.add(selectIssuingOffice);

    formWidgets.add(divider);

    formWidgets.add(issuedTo);
    formWidgets.add(selectreceivingDistrict);
    formWidgets.add(selectReceivingPollingDivision);
    formWidgets.add(selectReceivingOffice);
    formWidgets.add(selectReceivingPollingStation);

    formWidgets.add(btnNext);

    return formWidgets;
  }
}
