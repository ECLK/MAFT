import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/check_messages_viewModel.dart';

class CheckMessagesStepThree extends StatefulWidget {
  @override
  CheckMessagesStepThreeState createState() => CheckMessagesStepThreeState();
}

class CheckMessagesStepThreeState extends State<CheckMessagesStepThree> {
  bool checks = false;
  int timeStamps;
  int id = -1;

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
                    Navigator.of(context).pushNamed("/check-messages");
                  }),
            ],
          );
        });
  }

  Future<TimeOfDay> showTime(BuildContext context) {
    return showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckMessagesViewModel>(
        converter: (store) => CheckMessagesViewModel.create(store),
        builder: (context, viewModel) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Check Messages Step Three"),
                backgroundColor: Color.fromRGBO(72, 121, 209, 1),
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: new Column(
                  children: [
                    Padding(
                        padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RaisedButton(
                                  child: Text("Select Time"),
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(72, 121, 209, 1),
                                  onPressed: () {
                                    showTime(context).then((time) {
                                      print(time);
                                      viewModel.updateTime(time);
                                    });
                                  }),
                              new Padding(
                                  padding: new EdgeInsets.only(
                                      left: 10.0),
                                  child: new Text(
                                    viewModel.time != null ? viewModel.time.format(context).toString():"",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18.0),
                                  ))
                            ])),
                    Padding(
                        padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              new Text(
                                "Name of the ARO",
                                style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18.0),
                              ),
                              new TextField(onChanged: (value) {
                                viewModel.updateNameARO(value);
                              }),
                            ])),
                    Padding(
                        padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              new Text(
                                "Remarks",
                                style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18.0),
                              ),
                              new TextField(onChanged: (value) {
                                viewModel.updateRemarks(value);
                              }),
                            ])),
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
                                color: viewModel.time !=null && viewModel.nameARO!=null && viewModel.nameARO!=""
                                    ? Color.fromRGBO(72, 121, 209, 1)
                                    : Color.fromRGBO(211, 211, 211, 1),
                                child: Text('Submit',
                                    style: TextStyle(fontSize: 20)),
                                onPressed: () {
                                  bool h=viewModel.nameARO!=null;
                                  if (viewModel.time !=null && viewModel.nameARO!=null && viewModel.nameARO!="") {
                                    showAlert(context);
                                  }
                                }))),
                  ],
                ),
              ));
        });
  }
}
