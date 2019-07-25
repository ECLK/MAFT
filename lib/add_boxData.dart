import 'package:flutter/material.dart';
import 'package:tabulation/camera_view.dart';

class AddBoxData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Polling Station',
      home: new BoxList()
    );
  }
}

class BoxList extends StatefulWidget {
  @override
  createState() => new BoxListState();
}

class BoxListState extends State<BoxList> {
  List<String> _boxItems = [];

  final textIdController = TextEditingController();
  final textOrdinaryBallotsController = TextEditingController();
  final textTenderBallotsController = TextEditingController();

  void _addBoxItem(String task) {
    // Only add the task if the user actually entered something
    if(task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      setState(() => _boxItems.add(task));
    }
  }

  void _removeBoxItem(int index) {
    setState(() => _boxItems.removeAt(index));
  }

  // Remove Dialog box
  void _promptRemoveBoxItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Do you want to remove "${_boxItems[index]}" ?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              // The alert is actually part of the navigation stack, so to close it, we
              // need to pop it.
              onPressed: () => Navigator.of(context).pop()
            ),
            new FlatButton(
              child: new Text('REMOVE BOX'),
              onPressed: () {
                _removeBoxItem(index);
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }

  // Build the whole list of ballot box items
  Widget _buildBoxList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of box items we have. So, we need to check the index is OK.
        if(index < _boxItems.length) {
          return _buildNoxItem(_boxItems[index], index);
        }
      },
    );
  }

  // Build a single box item
  Widget _buildNoxItem(String boxText, int index) {
    return new ListTile(
      title: new Text(boxText),
      onTap: () => _promptRemoveBoxItem(index)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Polling Station'),
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
      ),
      body: _buildBoxList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddBoxScreen,
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }

  void _pushAddBoxScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well as adding
      // a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Add Box Data'),
              backgroundColor: Color.fromRGBO(72, 121, 209, 1),
            ),
            body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
              child: new SizedBox(
                width: 350,
                height: 80.0,
              child: new RaisedButton(
                  textColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Text(
                    'Scan the box label',
                     style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CameraView()),
                    );
                  },
                ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30.0),
              child: new TextField(
              controller: textIdController,
              autofocus: true,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Box Id',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            ),

            ),
            new SizedBox(
              height: 15.0,
            ),

            Padding(
              padding: const EdgeInsets.only( top:5.0, right: 30.0, left: 30.0),
              child: new TextField(
              controller: textOrdinaryBallotsController,
              autofocus: true,
               
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ordinary Ballot Paper Count',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:20.0, right: 30.0, left: 30.0),
              child: new TextField(
              autofocus: true,
              controller: textTenderBallotsController,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tender Ballot Paper Count',
                contentPadding: const EdgeInsets.all(16.0)
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
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Color.fromRGBO(72, 121, 209, 1),
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 20),
                  ),
                   onPressed: () {
                   _addBoxItem(textIdController.text+" - ("+textOrdinaryBallotsController.text+" Ballots)");
                    print(textIdController.text+" "+textOrdinaryBallotsController.text);
                   Navigator.pop(context); // Close the add ballot box screen
              },
                  // onPressed: () {
                  //   _addboxItem(textIdController.text+" - ("+textOrdinaryBallotsController.text+" Ballots)");
                  //   print(textIdController.text+" "+textOrdinaryBallotsController.text);
                  //   Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AddBoxData()),
                  //   );
                  // },
                ),
              ),
            ),
            
          ],
        ),
      ),
            

          );
        }
      )
    );
  }
}