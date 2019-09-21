import 'package:flutter/material.dart';
import 'package:tabulation/screens/widgets/receiving_stepone_form.dart';

class ReceivingStepOne extends StatefulWidget {

  @override
  _ReceivingStepOneState createState() => new _ReceivingStepOneState();
}

class _ReceivingStepOneState extends State<ReceivingStepOne> {


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
