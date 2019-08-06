import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://localhost:5000/invoice?limit=20&offset=0"),
        headers: {"Accept": "application/json"});
    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[1]["issuedAt"]);
    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Invoices"), backgroundColor:  Color.fromRGBO(72, 121, 209, 1)),
      body: 
      new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("Invoice ID : "+data[index]["issuedAt"]),
            // child: new Text("Invoice ID : "+data[index]["issuedAt"],
            // style: TextStyle(
            // color: Colors.blue[800],
            // fontSize: 20),),
          );
        },
      ),
    );
  }
}
