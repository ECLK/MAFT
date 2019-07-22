import 'package:flutter/material.dart';

import 'main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Home"),
      ),
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 30.0),
              child: new Text("Main Features",
                style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            
            Padding(
             padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 60.0,
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: Color.fromRGBO(72, 121, 209, 1),
                  child: Text(
                    'Issuing Process',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ),
            ),

            Padding(
             padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 60.0,
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: Color.fromRGBO(72, 121, 209, 1),
                  child: Text(
                    'Receiving Process',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ),
            ),

            Padding(
             padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 60.0,
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: Color.fromRGBO(72, 121, 209, 1),
                  child: Text(
                    'Add Ballot Box',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ),
            ),

            Padding(
             padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 60.0,
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: Color.fromRGBO(72, 121, 209, 1),
                  child: Text(
                    'Counting Process',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
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