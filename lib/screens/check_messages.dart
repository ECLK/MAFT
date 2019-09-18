import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/office_request.dart';
import 'package:tabulation/view_models/issuing_viewmodel.dart';
import 'package:tabulation/util/strings.dart';

class CheckMessages extends StatefulWidget {
  @override
  CheckMessagesState createState() => CheckMessagesState();
}

class CheckMessagesState extends State<CheckMessages> {
  List<bool> checks = [false, false, false, false, false];
  List<int> timeStamps = new List(5);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IssuingViewModel>(
        converter: (store) => IssuingViewModel.fromStore(store),
        builder: (context, viewModel) {
          List<Office> countingCenters = new List();

          viewModel.offices.forEach((Office office) {
            if (office.officeType == "CountingCentre") {
              countingCenters.add(office);
            }
          });

          return Scaffold(
              appBar: AppBar(
                title: Text("Check Messages"),
                backgroundColor: Color.fromRGBO(72, 121, 209, 1),
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: new Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, right: 0.0, left: 0.0),
                          child: new Text(
                            'Issued from : ',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                        new Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: new Container(
                              padding: new EdgeInsets.only(left: 5.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  DropdownButton(
                                      isExpanded: true,
                                      items: [
                                        new DropdownMenuItem(
                                            child: new Text("Counting Station"))
                                      ],
                                      hint: new Text("Select Station"),
                                      onChanged: (value) {}),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new DropdownButton(
                        isExpanded: true,
                        items: countingCenters.map((office) {
                          return new DropdownMenuItem(
                              value: office.officeId,
                              child: new Text(office.officeName));
                        }).toList(),
                        hint: new Text("Select station"),
                        onChanged: (value) =>
                            viewModel.updateIssuingOffice(value),
                        value: viewModel.invoice.issuingOfficeId,
                      ),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg1),
                          value: checks[0],
                          onChanged: (bool val) {
                            setState(() {
                              checks[0] = val;
                              if (val)
                                timeStamps[0] =
                                    new DateTime.now().millisecondsSinceEpoch;
                              print(timeStamps[0]);
                            });
                          }),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg2),
                          value: checks[1],
                          onChanged: (bool val) {
                            setState(() {
                              checks[1] = val;
                              if (val)
                                timeStamps[1] =
                                    new DateTime.now().millisecondsSinceEpoch;
                            });
                          }),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg3),
                          value: checks[2],
                          onChanged: (bool val) {
                            setState(() {
                              checks[2] = val;
                              if (val)
                                timeStamps[2] =
                                    new DateTime.now().millisecondsSinceEpoch;
                            });
                          }),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg4),
                          value: checks[3],
                          onChanged: (bool val) {
                            setState(() {
                              checks[3] = val;
                              if (val)
                                timeStamps[3] =
                                    new DateTime.now().millisecondsSinceEpoch;
                            });
                          }),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg5),
                          value: checks[4],
                          onChanged: (bool val) {
                            setState(() {
                              checks[4] = val;
                              if (val)
                                timeStamps[4] =
                                    new DateTime.now().millisecondsSinceEpoch;
                            });
                          }),
                    ),
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
                              color: Color.fromRGBO(72, 121, 209, 1),
                              child: Text('Submit',
                                  style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                
                              },
                            )))
                  ],
                ),
              ));
        });
  }
}
