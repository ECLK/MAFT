import 'package:flutter/material.dart';
import 'package:tabulation/screens/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final logo = Hero(
      tag: 'logo',
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: CircleAvatar(
          radius: 52.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('voting.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Results Tabulation',
        style: TextStyle(fontSize: 28.0),
      ),
    );

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            logo,  
            welcome,
            SizedBox(height: 48.0),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}