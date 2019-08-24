import 'package:flutter/material.dart';
import 'package:tabulation/routes.dart';

void main() => runApp(new TabulationApp());

class TabulationApp extends StatelessWidget {

  // This widget is the root of results tabulation application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Results Tabulation',
      routes: routes,
    );
  }
}