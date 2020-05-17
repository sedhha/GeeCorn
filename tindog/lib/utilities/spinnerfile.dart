import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
Widget scaffy=Scaffold(
  body: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/Background.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child:SpinKitDoubleBounce(
        color: Colors.white,
        size: 150.0,
      ),
    ),
  ),
);