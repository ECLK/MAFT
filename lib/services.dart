import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tabulation/main.dart';

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
        itemCount: data == null ? "Empty" : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: new ListTile(
              leading: Icon(Icons.filter_list),
              subtitle: Text("Issued Date : "+data[index]["issuedAt"].substring(0, 10)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('Star');
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
            );
              },
              title: Text("Invoice ID : " +  data[index]["invoiceId"].toString(), 
              style: TextStyle(
                color: Colors.blue[800],
              ),)
              // child: new Text("Invoice ID : "+data[index]["issuedAt"],
              // style: TextStyle(
              // color: Colors.blue[800],
              // fontSize: 20),),
            ),
          );
        },
      ),
    );
  }
}
