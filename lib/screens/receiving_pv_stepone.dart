import 'package:flutter/material.dart';
import 'package:tabulation/screens/widgets/receiving_pv_stepone_form.dart';

class ReceivingPvStepOneScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<ReceivingPvStepOneScreen> {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          ReceivingStepOneForm(),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Receiving - Step 1 of 2"),
      ),
      body: body,
    );
  }
}
