import 'package:flutter/material.dart';

class BallotBoxesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: new BoxList(),
      ),
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
    if (task.length > 0) {
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
                    onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text('REMOVE BOX'),
                    onPressed: () {
                      _removeBoxItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  // Build the whole list of ballot box items
  Widget _buildBoxList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of box items we have. So, we need to check the index is OK.
        if (index < _boxItems.length) {
          return _buildNoxItem(_boxItems[index], index);
        }
      },
    );
  }

  // Build a single box item
  Widget _buildNoxItem(String boxText, int index) {
    return new ListTile(
        title: new Text(boxText), onTap: () => _promptRemoveBoxItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('All Ballot Boxes'),
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
      ),
      body: _buildBoxList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add-ballot-box');
          },
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }
}
