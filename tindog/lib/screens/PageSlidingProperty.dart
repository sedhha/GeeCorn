import 'package:flutter/material.dart';
class PageSwipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageSwipper();
  }
}
class PageSwipper extends StatefulWidget {
  @override
  _PageSwipperState createState() => _PageSwipperState();
}

class _PageSwipperState extends State<PageSwipper> {
  final controller=PageController(
    initialPage: 0,
  );
  List<Widget> AssetProfileWidgets=[];
  @override
  void initState() {
    // TODO: implement initState
    AssetProfileWidgets.add(Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sp1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: null,
      ),
    ));
    for(int i=0;i<16;i++)
    {
      AssetProfileWidgets.add(Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/p${i+1}.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: null,
        ),
      ));
    }
    super.initState();
  }
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
        child: PageView(
          controller: controller,
          children: AssetProfileWidgets,
        ),
      ),
    );
  }
}
