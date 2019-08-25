import 'package:flutter/material.dart';

class CountingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Polling Stations"),
      ),
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Polling Station A',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/ballot-boxes');
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Polling Station B',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/ballot-boxes');
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Polling Station C',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/ballot-boxes');
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Polling Station D',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/ballot-boxes');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
