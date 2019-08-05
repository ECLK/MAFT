import 'package:flutter/material.dart';
import 'package:tabulation/home.dart';

class IssuingOptions extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<IssuingOptions> {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Issuing Process',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Color.fromRGBO(72, 121, 209, 1)),
      ),
    );

    final boxID = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Box ID',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final divider1 = Divider(
      height: 30.0,
      color: Colors.blueGrey,
    );

    final row1 = Row(
      children: <Widget>[
        new Text(
          'District Center   :     ',
          style: new TextStyle( fontWeight: FontWeight.bold,fontSize: 16.0),
        ),
        new DropdownButton<String>(
          hint: Text('District Center'),
          items: <String>['Colombo', 'Kandy', 'Galle', 'Kalutara']
              .map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );

    final row2 = Row(
      children: <Widget>[
        new Text(
          'Counting Center   :     ',
          style: new TextStyle( fontWeight: FontWeight.bold,fontSize: 16.0),
        ),
        new DropdownButton<String>(
          hint: Text('Counting Center'),
          items: <String>['Center A', 'Center B', 'Center C', 'Center D']
              .map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );

    final row3 = Row(
      children: <Widget>[
        new Text(
          'Polling Station   :     ',
          style: new TextStyle( fontWeight: FontWeight.bold,fontSize: 16.0),
        ),
        new DropdownButton<String>(
          hint: Text('Polling Stations'),
          items: <String>[
            'Science Collage',
            'St Thomas Collage',
            'Public Library Hall',
            'Royal Collage'
          ].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );

 final submitButton = SizedBox(
  width: 250.0,
  height: 50.0,
  child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          
        },
        padding: EdgeInsets.all(12),
        color: Colors.blueGrey,
        child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
      ),
  );
    final addBallotBoxesButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(72, 121, 209, 1),
        child: Text('ADD BALLOT BOXES', style: TextStyle(color: Colors.white)),
      ),
    );

 final addBallotBooksButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(72, 121, 209, 1),
        child: Text('ADD BALLOT BOOKS', style: TextStyle(color: Colors.white)),
      ),
    );

    final radioTitle1 = Text(
      'Ballot Boxes',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
    final radioTitle2 = Text(
      'Ballot Books',
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
          row1,
          SizedBox(height: 15.0),
          row2,
          SizedBox(height: 15.0),
          row3,
          SizedBox(height: 15.0),
          divider1,
          SizedBox(height: 6.0),
          radioTitle1,
          SizedBox(height: 15.0),
          boxID,
          SizedBox(height: 6.0),
          boxID,
          SizedBox(height: 6.0),
          boxID,
          SizedBox(height: 6.0),
          addBallotBoxesButton,
          SizedBox(height: 6.0),
          divider1,
          SizedBox(height: 15.0),
          radioTitle2,
          SizedBox(height: 15.0),
          boxID,
          SizedBox(height: 6.0),
          boxID,
          SizedBox(height: 6.0),
          addBallotBooksButton,
       
          divider1,
          submitButton

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
