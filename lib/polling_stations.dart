import 'package:flutter/material.dart';
import 'package:tabulation/add_boxData.dart';

class PollingStations extends StatelessWidget {
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
             padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Science Collage (Polling Station)',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBoxData()),
                    );
                  },
                ),
              ),
            ),

            Padding(
             padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'St.Thomas Collage (Polling Station)',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBoxData()),
                    );
                  },
                ),
              ),
            ),

            Padding(
             padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Public Libary Hall (Polling Station)',
                     style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBoxData()),
                    );
                  },
                ),
              ),
            ),

            Padding(
             padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Royal Collage (Polling Station)',
                     style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBoxData()),
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