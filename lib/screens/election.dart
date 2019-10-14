import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';
// import 'package:tabulation/store/models/office_request.dart';
import 'package:tabulation/view_models/election_viewmodel.dart';
import 'package:tabulation/view_models/home_viewmodel.dart';

class ElectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Select Election"),
        leading: new Container(),
      ),
      body: Election(),
    );
  }
}

class Election extends StatefulWidget {
  @override
  _ElectionState createState() {
    return _ElectionState();
  }
}

class _ElectionState extends State<Election> {
  List<Area> elections = new List<Area>();
final GlobalKey _menuKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new StoreConnector<AppState, ElectionViewModel>(
          converter: (store) => ElectionViewModel.fromStore(store),
          builder: (context, viewModel) {
            return new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: renderWidgets(viewModel),
            );
          }),
    );
  }

  List<Widget> renderWidgets(ElectionViewModel viewModel) {
    List<Widget> widgets = new List();

    viewModel.elections.forEach((election){
         widgets.add(ListTile(
              
              leading: Icon(Icons.people),
              title: Text(election.electionName),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                viewModel.navigateToSubElectionAction(election);
              },
            ));
    });
   





    // formWidgets.add(new Row(
    //   children: <Widget>[
    //     new Expanded(
    //       child: Padding(
    //         padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
    //         child: new DropdownButton(
    //           isExpanded: true,
    //           items: viewModel.elections.map((office) {
    //             return new DropdownMenuItem(
    //                 value: office.officeId, child: new Text(office.officeName));
    //           }).toList(),
    //           hint: new Text("Select election"),
    //           onChanged: (officeId) {
    //             viewModel.updateElection(viewModel.elections
    //                 .where((i) => i.officeId == officeId)
    //                 .first);
    //           },
    //           value: viewModel.selectedElection != null
    //               ? viewModel.selectedElection.officeId
    //               : null,
    //         ),
    //       ),
    //     ),
    //   ],
    // ));

    // formWidgets.add(new Padding(
    //   padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
    //   child: new SizedBox(
    //     width: 350,
    //     height: 60.0,
    //     child: new RaisedButton(
    //       textColor: Colors.white,
    //       shape: new RoundedRectangleBorder(
    //           borderRadius: new BorderRadius.circular(10.0)),
    //       color: viewModel.selectedElection != null
    //           ? Color.fromRGBO(72, 121, 209, 1)
    //           : Color.fromRGBO(211, 211, 211, 1),
    //       child: Text(
    //         'Issuing Process',
    //         style: TextStyle(fontSize: 20),
    //       ),
    //       onPressed: () {
    //         viewModel.selectedElection != null
    //             ? Navigator.of(context).pushNamed('/issuing-stepone')
    //             : null;
    //       },
    //     ),
    //   ),
    // ));

    // formWidgets.add(new Padding(
    //   padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
    //   child: new SizedBox(
    //     width: 350,
    //     height: 60.0,
    //     child: new RaisedButton(
    //       textColor: Colors.white,
    //       shape: new RoundedRectangleBorder(
    //           borderRadius: new BorderRadius.circular(10.0)),
    //       color: viewModel.selectedElection != null
    //           ? Color.fromRGBO(72, 121, 209, 1)
    //           : Color.fromRGBO(211, 211, 211, 1),
    //       child: Text(
    //         'Receiving Process',
    //         style: TextStyle(fontSize: 20),
    //       ),
    //       onPressed: () {
    //         viewModel.selectedElection != null
    //             ? Navigator.of(context).pushNamed('/receiving-stepone')
    //             : null;
    //       },
    //     ),
    //   ),
    // ));

    // formWidgets.add(new Padding(
    //     padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
    //     child: new SizedBox(
    //         width: 350,
    //         height: 60.0,
    //         child: new RaisedButton(
    //           textColor: Colors.white,
    //           shape: new RoundedRectangleBorder(
    //               borderRadius: new BorderRadius.circular(10.0)),
    //           color: viewModel.selectedElection != null
    //               ? Color.fromRGBO(72, 121, 209, 1)
    //               : Color.fromRGBO(211, 211, 211, 1),
    //           child: Text('Check Messages', style: TextStyle(fontSize: 20)),
    //           onPressed: () {
    //             viewModel.selectedElection != null
    //                 ? Navigator.of(context).pushNamed("/check-messages")
    //                 : null;
    //           },
    //         ))));

    // formWidgets.add(new Padding(
    //   padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
    //   child: new SizedBox(
    //     width: 350,
    //     height: 60.0,
    //     child: new RaisedButton(
    //       textColor: Colors.white,
    //       shape: new RoundedRectangleBorder(
    //           borderRadius: new BorderRadius.circular(10.0)),
    //       color: Color.fromRGBO(211, 211, 211, 1),
    //       child: Text(
    //         'Counting Process',
    //         style: TextStyle(fontSize: 20),
    //       ),
    //       onPressed: () {
    //         // phase II
    //         //Navigator.of(context).pushNamed('/counting');
    //       },
    //     ),
    //   ),
    // ));

    // formWidgets.add(new Padding(
    //   padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
    //   child: new SizedBox(
    //     width: 350,
    //     height: 60.0,
    //     child: new RaisedButton(
    //       textColor: Colors.white,
    //       shape: new RoundedRectangleBorder(
    //           borderRadius: new BorderRadius.circular(10.0)),
    //       color: Color.fromRGBO(211, 211, 211, 1),
    //       child: Text(
    //         'Approval Process',
    //         style: TextStyle(fontSize: 20),
    //       ),
    //       onPressed: () {},
    //     ),
    //   ),
    // ));

    return widgets;
  }
}
