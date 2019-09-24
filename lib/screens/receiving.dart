import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tabulation/services.dart';

class ReceivingScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _ReceivingScreenState createState() => new _ReceivingScreenState();
}

class _ReceivingScreenState extends State<ReceivingScreen> {
  static String tag = 'home-page';

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://localhost:5000/invoice?limit=20&offset=0"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Receving Invoices',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Color.fromRGBO(72, 121, 209, 1)),
      ),
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
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(72, 121, 209, 1),
        child: Text('NEXT', style: TextStyle(color: Colors.white)),
      ),
    );

    final row1 = Row(
      children: <Widget>[
        new Text(
          'District Center   :     ',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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

    final list = ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Text(data[index]["issuedAt"]),
        );
      },
    );

    final body = SingleChildScrollView(
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          welcome,
          SizedBox(height: 15.0),
          row1,
          row2,
          row3,
          SizedBox(height: 15.0),
          nextButton,
          SizedBox(height: 15.0),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Receving Process"),
      ),
      body: body,
    );
  }
}
