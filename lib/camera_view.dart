import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(CameraView());

class CameraView extends StatefulWidget {
    @override
  State<StatefulWidget> createState() => new Camera();
}

class Camera extends State<CameraView> {
// class _MyAppState extends State<MyApp>{
  File _image;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(title: 'ImagePicker',
    home: new Scaffold(
      appBar:  new AppBar(title: new Text('Camera View'),
      backgroundColor: Color.fromRGBO(72, 121, 209, 1),
      ),
      body: new Center(child: _image == null? new Text('no image avialable '):new Image.file(_image)
      ,),
      floatingActionButton: new FloatingActionButton(onPressed: getImage,tooltip: 'Picker Image',child: new Icon(Icons.camera),
      ),
    ),
    );

  }

}