import 'package:flutter/material.dart';

import 'main.dart';

class Issuring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Issuing Process"),
      ),
      body: SingleChildScrollView(
        // width: double.infinity,
        child: new Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // new Row(),
            Padding(
              padding: const EdgeInsets.only( top: 20.0, bottom: 20.0),
              child: new Text("Polling Station",
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new DropdownButton<String>(
                hint: Text('Polling Stations'),
                items: <String>['Science Collage', 'St Thomas Collage', 'Public Library Hall', 'Royal Collage'].map((String value) {
                return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
                );
                }).toList(),
                onChanged: (_) {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.only( top: 20.0, bottom: 20.0),
              child: new Text("Ballot Boxes",
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0,right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 200,
                height: 50.0,
              child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ballot Box Id',
                contentPadding: const EdgeInsets.all(16.0)
              ),
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 200,
                height: 50.0,
              child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ballot Box Id',
                contentPadding: const EdgeInsets.all(16.0)
              ),
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 200,
                height: 50.0,
              child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ballot Box Id',
                contentPadding: const EdgeInsets.all(16.0)
              ),
              ),
            ),
            ),

            Padding(
             padding: const EdgeInsets.only(top: 7.0, right: 2.0, left: 2.0),
              child: new SizedBox(
                width: 100,
                height: 30.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'ADD',
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
              padding: const EdgeInsets.only( top: 40.0, bottom: 20.0),
              child: new Text("Ballot Books",
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0,right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 200,
                height: 50.0,
              child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'From No',
                contentPadding: const EdgeInsets.all(16.0)
              ),
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,right: 30.0, left: 30.0),
              child: new SizedBox(
                width: 200,
                height: 50.0,
              child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'To No',
                contentPadding: const EdgeInsets.all(16.0)
              ),
              ),
            ),
            ),
           
            Padding(
             padding: const EdgeInsets.only(top: 7.0, right: 2.0, left: 2.0),
              child: new SizedBox(
                width: 100,
                height: 30.0,
                child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'ADD',
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
             padding: const EdgeInsets.only(top: 40.0, bottom:40,right: 2.0, left: 2.0),
              child: new SizedBox(
                width: 200,
                height: 60.0,
                child: new RaisedButton(
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                  color: Color.fromRGBO(72, 121, 209, 1),
                  child: Text(
                    'Submit',
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