import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/util/strings.dart';
import 'package:tabulation/view_models/check_messages_viewModel.dart';

class CheckMessagesStepTwo extends StatefulWidget {
  @override
  CheckMessagesStepTwoState createState() => CheckMessagesStepTwoState();
}

class CheckMessagesStepTwoState extends State<CheckMessagesStepTwo> {
  bool checks = false;
  int timeStamps;
  int id = -1;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckMessagesViewModel>(
        converter: (store) => CheckMessagesViewModel.create(store),
        builder: (context, viewModel) {
  

          return Scaffold(
              appBar: AppBar(
                title: Text("Check Messages Step Two"),
                backgroundColor: Color.fromRGBO(72, 121, 209, 1),
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: new Column(
                  children: [
                    
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
                                color: id != -1 
                                    ? Color.fromRGBO(72, 121, 209, 1)
                                    : Color.fromRGBO(211, 211, 211, 1),
                                child: Text('Next',
                                    style: TextStyle(fontSize: 20)),
                                onPressed: () {
                                  if (id != -1)
                                    viewModel.navigateToStepThree();
                                }))),
                  ],
                ),
              ));
        });
  }
}
