import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';
import 'package:tabulation/view_models/issuing_viewmodel.dart';
import 'package:tabulation/util/strings.dart';

Future<void> showAlert(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Submission successful!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your message has been sent successfully.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      });
}

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
    return StoreConnector<AppState, IssuingViewModel>(
        converter: (store) => IssuingViewModel.fromStore(store),
        builder: (context, viewModel) {
          List<Area> countingCenters = new List();

          if (viewModel.areas != null) {
            viewModel.areas.forEach((area) {
              if (area.areaType == "CountingCentre" && area.areaName != "") {
                countingCenters.add(area);
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
                        items: countingCenters.map((area) {
                          return new DropdownMenuItem(
                              value: area.areaId,
                              child: new Text(area.areaName));
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
                          value: id == 1,
                          onChanged: (bool val) {
                            setState(() {
                              if (val) {
                                id = 1;
                                timeStamps =
                                    new DateTime.now().millisecondsSinceEpoch;
                              }
                            });
                          }),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg2),
                          value: id == 2,
                          onChanged: (bool val) {
                            setState(() {
                              if (val) {
                                id = 2;
                                timeStamps =
                                    new DateTime.now().millisecondsSinceEpoch;
                              }
                            });
                          }),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg3),
                          value: id == 3,
                          onChanged: (bool val) {
                            setState(() {
                              if (val) {
                                id = 3;
                                timeStamps =
                                    new DateTime.now().millisecondsSinceEpoch;
                              }
                            });
                          }),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg4),
                          value: id == 4,
                          onChanged: (bool val) {
                            setState(() {
                              if (val) {
                                id = 4;
                                timeStamps =
                                    new DateTime.now().millisecondsSinceEpoch;
                              }
                            });
                          }),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new CheckboxListTile(
                          title: Text(msg5),
                          value: id == 5,
                          onChanged: (bool val) {
                            setState(() {
                              if (val) {
                                id = 5;
                                timeStamps =
                                    new DateTime.now().millisecondsSinceEpoch;
                              }
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
                                color: id != -1 &&
                                        viewModel.invoice.issuingOfficeId !=
                                            null
                                    ? Color.fromRGBO(72, 121, 209, 1)
                                    : Color.fromRGBO(211, 211, 211, 1),
                                child: Text('Submit',
                                    style: TextStyle(fontSize: 20)),
                                onPressed: () {
                                  if (id != -1 &&
                                      viewModel.invoice.issuingOfficeId != null)
                                    showAlert(context);
                                }))),
                  ],
                ),
              ));
        });
  }
}
