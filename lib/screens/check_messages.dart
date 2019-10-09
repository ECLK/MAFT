import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';
import 'package:tabulation/util/strings.dart';
import 'package:tabulation/view_models/check_messages_viewModel.dart';

class CheckMessages extends StatefulWidget {
  @override
  CheckMessagesState createState() => CheckMessagesState();
}

class CheckMessagesState extends State<CheckMessages> {
  bool checks = false;
  int timeStamps;
  int id = -1;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckMessagesViewModel>(
        converter: (store) => CheckMessagesViewModel.create(store),
        builder: (context, viewModel) {
          List<Area> countingCenters = new List();
          List<Area> electoralDistrict = new List();
          List<Area> pollingStation = new List();
          List<Area> pollingDivision = new List();

          if (viewModel.areas != null) {
            viewModel.areas.forEach((area) {
              if (area.areaType == "CountingCentre" && area.areaName != "") {
                countingCenters.add(area);
              } else if (area.areaType == "ElectoralDistrict" &&
                  area.areaName != "") {
                electoralDistrict.add(area);
              } else if (area.areaType == "PollingStation" &&
                  area.areaName != "") {
                pollingStation.add(area);
              } else if (area.areaType == "PollingDivision" &&
                  area.areaName != "") {
                pollingDivision.add(area);
              }
            });

            //temp fix until Dinuka implements - sort counting centers
            countingCenters.sort((a, b) =>
                int.parse(a.areaName).compareTo(int.parse(b.areaName)));
          }

          return Scaffold(
              appBar: AppBar(
                title: Text("Check Messages"),
                backgroundColor: Color.fromRGBO(72, 121, 209, 1),
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: new Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 0.0, left: 0.0),
                      child: new Text(
                        'Issued from : ',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: new DropdownButton(
                          isExpanded: true,
                          items: electoralDistrict.map((area) {
                            return new DropdownMenuItem(
                                value: area.areaId,
                                child: new Text(area.areaName));
                          }).toList(),
                          hint: new Text("Select Electoral District"),
                          onChanged: (value) {
                            viewModel.updateElectoralDistrictId(value);
                          },
                          value: viewModel.electoralDistrictId,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: new DropdownButton(
                            isExpanded: true,
                            items: pollingDivision.map((area) {
                              return new DropdownMenuItem(
                                  value: area.areaId,
                                  child: new Text(area.areaName));
                            }).toList(),
                            hint: new Text("Select Polling Division"),
                            onChanged: (value) {
                              viewModel.updatePollingDivisionId(value);
                            },
                            value: viewModel.pollingDivisionId)),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new DropdownButton(
                          isExpanded: true,
                          items: countingCenters.map((area) {
                            return new DropdownMenuItem(
                                value: area.areaId,
                                child: new Text(area.areaName));
                          }).toList(),
                          hint: new Text("Select Counting Center"),
                          onChanged: (value) =>
                              viewModel.updateCountingCenterId(value),
                          value: viewModel.countingCenterId),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: new DropdownButton(
                            isExpanded: true,
                            items: pollingStation.map((area) {
                              return new DropdownMenuItem(
                                  value: area.areaId,
                                  child: new Text(area.areaName));
                            }).toList(),
                            hint: new Text("Select Polling Station"),
                            onChanged: (value) {
                              viewModel.updatePollingStationId(value);
                            },
                            value: viewModel.pollingStationId)),
                    Padding(
                        padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: new SizedBox(
                            width: 350,
                            height: 60.0,
                            child: new RaisedButton(
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                color: viewModel.countingCenterId != null &&
                                        viewModel.pollingDivisionId != null &&
                                        viewModel.pollingStationId != null &&
                                        viewModel.electoralDistrictId != null
                                    ? Color.fromRGBO(72, 121, 209, 1)
                                    : Color.fromRGBO(211, 211, 211, 1),
                                child: Text('Next',
                                    style: TextStyle(fontSize: 20)),
                                onPressed: () {
                                  if (viewModel.countingCenterId != null &&
                                      viewModel.pollingDivisionId != null &&
                                      viewModel.pollingStationId != null &&
                                      viewModel.electoralDistrictId != null)
                                    viewModel.navigateToStepTwo();
                                }))),
                  ],
                ),
              ));
        });
  }
}
