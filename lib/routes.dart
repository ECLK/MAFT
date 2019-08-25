import 'package:flutter/material.dart';
import 'package:tabulation/screens/add_ballot_box.dart';
import 'package:tabulation/screens/ballot_boxes.dart';
import 'package:tabulation/screens/home.dart';
import 'package:tabulation/screens/issuing-stepone.dart';
import 'package:tabulation/screens/issuing-steptwo.dart';
import 'package:tabulation/screens/login.dart';
import 'package:tabulation/screens/counting.dart';
import 'package:tabulation/screens/receiving.dart';
import 'package:tabulation/screens/widgets/camera_view.dart';

final routes = {
  '/home': (BuildContext context) => new HomeScreen(),
  '/': (BuildContext context) => new LoginScreen(),
  '/login': (BuildContext context) => new LoginScreen(),
  '/issuing-stepone': (BuildContext context) => new IssuingStepOneScreen(),
  '/issuing-steptwo': (BuildContext context) => new IssuingStepTwoScreen(),
  '/counting': (BuildContext context) => new CountingScreen(),
  '/receiving': (BuildContext context) => new ReceivingScreen(),
  '/ballot-boxes': (BuildContext context) => new BallotBoxesScreen(),
  '/camera-view': (BuildContext context) => new CameraView(),
  '/add-ballot-box': (BuildContext context) => new AddBallotBoxScreen(),
};
