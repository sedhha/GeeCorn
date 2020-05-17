import 'package:flutter/material.dart';
import 'package:tindog/screens/welcomescreen.dart';
import 'package:tindog/screens/SwippingScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackgroundScreen(),
    );
  }
}
