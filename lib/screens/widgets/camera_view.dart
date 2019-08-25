import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: new CameraPicker(),
      ),
    );
  }
}

class CameraPicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => new _ImagePickerState();
}

class _ImagePickerState extends State<CameraPicker> {
  File _image;

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(72, 121, 209, 1),
        title: Text("Image Picker"),
      ),
      body: Container(
        width: double.infinity,
        child: new Center(
            child: _image == null
                ? new Text('Please choose your first picture.')
                : new Image.file(_image)),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _optionsDialogBox,
        tooltip: 'Picker Image',
        child: new Icon(Icons.camera),
      ),
    );
  }
}
