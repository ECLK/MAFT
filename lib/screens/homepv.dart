import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/home_viewmodel.dart';

class HomePvScreen extends StatelessWidget {
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
      body: HomePv(),
    );
  }
}

class HomePv extends StatefulWidget {
  @override
  _HomePvState createState() {
    return _HomePvState();
  }
}

class _HomePvState extends State<HomePv> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new StoreConnector<AppState, HomeViewModel>(
          onInit: (store) {
            store.dispatch(new FetchOficeAllAction(store.state.officeState.selectedElection.electionId));
          },
          converter: (store) => HomeViewModel.fromStore(store),
          builder: (context, viewModel) {
            return new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
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
                        Navigator.of(context).pushNamed('/issuing-stepone-pv');
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
