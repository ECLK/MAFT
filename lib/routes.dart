import 'package:flutter/material.dart';
import 'package:tabulation/screens/home.dart';
import 'package:tabulation/screens/login.dart';

final routes = {
  '/home': (BuildContext context) => new Home(),
  '/': (BuildContext context) => new LoginScreen(),
  '/login': (BuildContext context) => new LoginScreen(),
};