import 'package:flutter/material.dart';
import 'issuing_options.dart';

class IssuingMain extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<IssuingMain> {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Issuing Process',
        style: TextStyle(  fontWeight: FontWeight.bold,
        fontSize: 24.0 ,color: Color.fromRGBO(72, 121, 209, 1)),
      ),
    );

    final issuedFrom = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Issued By',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final issuedTo = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Issued To',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final divider1 = Divider(
      height: 30.0,
      color: Colors.blueGrey,
    );

    final nextButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IssuingOptions()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(72, 121, 209, 1),
        child: Text('NEXT', style: TextStyle(color: Colors.white)),
      ),
    );

    final row1 = Row(
      children: <Widget>[
        new Radio(
          value: 0,
        ),
        new Text(
          'Election Commission',
          style: new TextStyle(fontSize: 16.0),
        ),
      ],
    );

    final row2 = Row(
      children: <Widget>[
        new Radio(
          value: 1,
        ),
        new Text(
          'District Centre',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );

    final row3 = Row(
      children: <Widget>[
        new Radio(
          value: 1,
        ),
        new Text(
          'Counting Center',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );

    final row4 = Row(
      children: <Widget>[
        new Radio(
          value: 1,
        ),
        new Text(
          'Polling Station',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );

    final radio1 = Radio(
      value: 0,
    );

    final radioTitle1 = Text(
      'Issued From',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
    final radioTitle2 = Text(
      'Issued To',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
    final body = SingleChildScrollView(
      // width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(colors: [
      //     Colors.blue,
      //     Colors.lightBlueAccent,
      //   ]),
      // ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          welcome,
          SizedBox(height: 20.0),
          issuedFrom,
          SizedBox(height: 10.0),
          issuedTo,
          SizedBox(height: 24.0),
          divider1,
          SizedBox(height: 15.0),
          radioTitle1,
          SizedBox(height: 15.0),
          row1,
          row2,
          row3,
          row4,
          SizedBox(height: 15.0),
          divider1,
          SizedBox(height: 15.0),
          radioTitle2,
          SizedBox(height: 15.0),
          row1,
          row2,
          row3,
          row4,
          nextButton
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Issuing Process"),
      ),
      body: body,
    );
  }
}
