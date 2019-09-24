import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Home"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/login");
            },
            child: Text("Log out"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        leading: new Container(),
      ),
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new StoreConnector<AppState, HomeViewModel>(
          onInit: (store) {
            if (store.state.officeState.areas == null) {
              store.dispatch(new FetchOficeAllAction(
                  store.state.officeState.selectedSubElection.electionId));
            }
          },
          converter: (store) => HomeViewModel.fromStore(store),
          builder: (context, viewModel) {
            return new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getFormWidget(viewModel),
            );
          }),
    );
  }

  List<Widget> getFormWidget(HomeViewModel viewModel) {
    List<Widget> formWidgets = new List();

    final issuing = new Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
      child: new SizedBox(
        width: 350,
        height: 60.0,
        child: new RaisedButton(
          textColor: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          color: Color.fromRGBO(72, 121, 209, 1),
          child: Text(
            'Issuing Process',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            viewModel.selectedSubElection.voteType == "NonPostal"
                ? Navigator.of(context).pushNamed('/issuing-stepone')
                : Navigator.of(context).pushNamed('/issuing-stepone-pv');
          },
        ),
      ),
    );

    final receiving = new Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
      child: new SizedBox(
        width: 350,
        height: 60.0,
        child: new RaisedButton(
          textColor: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          color: Color.fromRGBO(72, 121, 209, 1),
          child: Text(
            'Receiving Process',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/receiving-stepone');
          },
        ),
      ),
    );

    final checkMessages = new Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
        child: new SizedBox(
            width: 350,
            height: 60.0,
            child: new RaisedButton(
              textColor: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              color: Color.fromRGBO(72, 121, 209, 1),
              child: Text('Check Messages', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pushNamed("/check-messages");
              },
            )));

    final counting = new Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
      child: new SizedBox(
        width: 350,
        height: 60.0,
        child: new RaisedButton(
          textColor: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          color: Color.fromRGBO(211, 211, 211, 1),
          child: Text(
            'Counting Process',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            // phase II
            //Navigator.of(context).pushNamed('/counting');
          },
        ),
      ),
    );

    final approval = new Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
      child: new SizedBox(
        width: 350,
        height: 60.0,
        child: new RaisedButton(
          textColor: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          color: Color.fromRGBO(211, 211, 211, 1),
          child: Text(
            'Approval Process',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {},
        ),
      ),
    );

    formWidgets.add(issuing);
    if (viewModel.selectedSubElection.voteType == "NonPostal") {
      formWidgets.add(receiving);
      formWidgets.add(checkMessages);
      formWidgets.add(counting);
      formWidgets.add(approval);
    }

    return formWidgets;
  }
}
