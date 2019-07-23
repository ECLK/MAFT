import 'package:flutter/material.dart';

import 'main.dart';

class AddBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Ballot Boxes"),
      ),
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(),
            
            Padding(
              padding: const EdgeInsets.only(top: 7.0, right: 2.0, left: 2.0),
              child: new SizedBox(
                width: 380,
                height: 50.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Box 1 (345 Ballots)',
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
             padding: const EdgeInsets.only(top: 7.0, right: 2.0, left: 2.0),
              child: new SizedBox(
                width: 380,
                height: 50.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Box 2 (225 Ballots)',
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
             padding: const EdgeInsets.only(top: 300.0, right: 3.0, left: 3.0),
              child: new SizedBox(
                width: 380,
                height: 60.0,
                child: new RaisedButton(
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Color.fromRGBO(67,67,67, 1),
                  child: Text(
                    'Next',
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
// import 'package:flutter/material.dart';


// class PollingSations extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(72, 121, 209, 1),
//         title: Text("Polling Stations"),
//       ),
//       body: ListView(
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.add_location,color: Color.fromRGBO(72, 121, 209, 1),),
//               title: Text('Royal College'),
//             ),
//             ListTile(
//                 leading: Icon(Icons.add_location,color: Color.fromRGBO(72, 121, 209, 1),),
//               title: Text('St Thomas Collage'),
//             ),
//             ListTile(
//                 leading: Icon(Icons.add_location,color: Color.fromRGBO(72, 121, 209, 1),),
//               title: Text('Public Library Hall'),
//             ),
//           ],
//         ),
//     );
//   }
// }