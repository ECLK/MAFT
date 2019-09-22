import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/office_request.dart';
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
  List<Office> elections = new List<Office>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new StoreConnector<AppState, HomeViewModel>(
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

    formWidgets.add(new Row(
      children: <Widget>[
        new Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
            child: new DropdownButton(
              isExpanded: true,
              items: viewModel.elections.map((office) {
                return new DropdownMenuItem(
                    value: office.officeId, child: new Text(office.officeName));
              }).toList(),
              hint: new Text("Select election"),
              onChanged: (officeId) {
                viewModel.updateElection(viewModel.elections
                    .where((i) => i.officeId == officeId)
                    .first);
              },
              value: viewModel.selectedElection != null
                  ? viewModel.selectedElection.officeId
                  : null,
            ),
          ),
        ),
      ],
    ));

    formWidgets.add(new Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
      child: new SizedBox(
        width: 350,
        height: 60.0,
        child: new RaisedButton(
          textColor: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          color: viewModel.selectedElection != null
              ? Color.fromRGBO(72, 121, 209, 1)
              : Color.fromRGBO(211, 211, 211, 1),
          child: Text(
            'Issuing Process',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            viewModel.selectedElection != null
                ? Navigator.of(context).pushNamed('/issuing-stepone-pv')
                : null;
          },
        ),
      ),
    ));

    return formWidgets;
  }
}
