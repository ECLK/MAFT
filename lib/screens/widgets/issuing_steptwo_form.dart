import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/home_viewmodel.dart';
import 'package:tabulation/view_models/issuingsteptwo_viewmodel.dart';

class IssuingStepTwoForm extends StatefulWidget {
  @override
  _IssuingStepTwoFormState createState() => new _IssuingStepTwoFormState();
}


// to do
// POSt /ballot-book for from and to click on CHECK
// and /invoice/{invoiceId}/stationary-item when click on SAVE
// for ballot boxes get all using /ballot-box
// then for each /ballot-box POST it to /invoice/{invoiceId}/stationary-item



class _IssuingStepTwoFormState extends State<IssuingStepTwoForm> {
  final _formKey = GlobalKey<FormState>();
  List<Widget> _ballotBooks = new List<Widget>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: 
      // new StoreConnector<AppState, IssuingStepTwoViewModel>(
          // onInit: (store) {
          //   print('2- oninit');
          // },
          // onWillChange: (viewModel) {
          //   print('2- onWillChange');
          // },
          // onDidChange: (viewModel) {
          //   print('2- onDidchange');
          // },
          // converter: (store) => IssuingStepTwoViewModel.fromStore(store),
          // builder: (context, viewModel) {
             new Column(
              children: getFormWidget(),
            ),
          // }),
    );
  }

  List<Widget> getFormWidget() {
    // print('2- invoice id ' + viewModel.invoiceId.toString());

    List<Widget> formWidgets = new List();

    final ballotBooksHeading = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
            child: new Text(
              'Ballot Books',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
        new Flexible(
          child: IconButton(
            icon: Icon(Icons.add_circle),
            tooltip: 'Add Ballot Book',
            onPressed: () {},
          ),
        )
      ],
    );

    final ballotBookRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: new SizedBox(
            width: 140,
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'From',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
        new Flexible(
          child: new SizedBox(
            width: 140,
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'To',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
        // StoreConnector<int, String>(
        // converter: (store) => store.state.toString(),
        // builder: (context, viewModel) {
        //  new Flexible(
        //   child: new SizedBox(
        //     width: 100,
        //     child: new Text(
        //       viewModel,
        //       style: new TextStyle(
        //           fontWeight: FontWeight.bold, fontSize: 20.0),
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // ),
        // }),
        new Flexible(
          child: IconButton(
            icon: Icon(Icons.save),
            tooltip: 'Close Ballot Book',
            onPressed: () {},
          ),
        )
      ],
    );

    // var testone = <Widget>[]


    // final tenderBallotBooksHeading = new Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisSize: MainAxisSize.max,
    //   children: <Widget>[
    //     new Flexible(
    //       child: Padding(
    //         padding: const EdgeInsets.only(
    //             top: 0.0, right: 0.0, left: 0.0, bottom: 0.0),
    //         child: new SizedBox(
    //           width: 300,
    //           child: new Text(
    //             'Tender Ballot Books',
    //             style:
    //                 new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
    //           ),
    //         ),
    //       ),
    //     ),
    //     new Flexible(
    //       child: new SizedBox(
    //         width: 50,
    //         child: IconButton(
    //           icon: Icon(Icons.add_circle),
    //           tooltip: 'Add Tender Ballot Book',
    //           onPressed: () {},
    //         ),
    //       ),
    //     )
    //   ],
    // );

    final ballotBoxesHeading = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
          child: new Text(
            'Ballot Boxes',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
      ],
    );

    final ballotBoxRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0.0, left: 0.0),
            child: new Text(
              'Box: b-1',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
        new Flexible(
          child: IconButton(
            icon: Icon(Icons.check_box_outline_blank),
            tooltip: 'Add Ballot Book',
            onPressed: () {},
          ),
        )
      ],
    );

    final divider = Divider(
      height: 30.0,
      color: Colors.blueGrey,
    );

    final btnSubmit = Padding(
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
            'Submit',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            if (!_formKey.currentState.validate()) {
            } else {
              Navigator.of(context).popUntil(ModalRoute.withName('/home'));
            }
          },
        ),
      ),
    );

    final body = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ballotBooksHeading,
          SizedBox(height: 15.0),
          ballotBookRow,
          SizedBox(height: 15.0),
          divider,
          // SizedBox(height: 15.0),
          // tenderBallotBooksHeading,
          // SizedBox(height: 15.0),
          // ballotBookRow,
          // SizedBox(height: 15.0),
          // divider,
          SizedBox(height: 15.0),
          ballotBoxesHeading,
          SizedBox(height: 15.0),
          ballotBoxRow,
          ballotBoxRow,
          ballotBoxRow,
          SizedBox(height: 15.0),
          btnSubmit,
        ],
      ),
    );

    formWidgets.add(body);

    return formWidgets;
  }
}
