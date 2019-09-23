import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/view_models/issuingsuccess_viewmodel.dart';

class ReceivingSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'logo',
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: CircleAvatar(
          radius: 52.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('voting.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Receiving Successful',
        style: TextStyle(fontSize: 28.0),
      ),
    );

    final btnContinue = Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
      child: new SizedBox(
        width: double.infinity,
        height: 60.0,
        child: new StoreConnector<AppState, IssuingSuccessViewModel>(
            converter: (store) => IssuingSuccessViewModel.fromStore(store),
            builder: (context, viewModel) {
              return new RaisedButton(
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                color: Color.fromRGBO(72, 121, 209, 1),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  viewModel.clearInvoice();
                  viewModel.clearBallotBooks();
                  viewModel.clearBallotBoxes();
                  Navigator.of(context).popAndPushNamed('/home');
                },
              );
            }),
      ),
    );

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30.0),
        child: new Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            logo,
            welcome,
            SizedBox(height: 48.0),
            btnContinue,
          ],
        ),
      ),
    );
  }
}
