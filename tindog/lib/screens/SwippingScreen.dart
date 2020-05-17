import 'package:flutter/material.dart';
class DemoScc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoSCC();
  }
}
class DemoSCC extends StatefulWidget {
  @override
  _DemoSCCState createState() => _DemoSCCState();
}

class _DemoSCCState extends State<DemoSCC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sp1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

