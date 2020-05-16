import 'package:flutter/material.dart';
import 'register.dart';
class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 200,),
              Container(
                width: 300,
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                    primaryColorDark: Colors.white,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email-ID',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hoverColor: Color(0xff055E98),

          ),
        ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                    primaryColorDark: Colors.white,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hoverColor: Color(0xff055E98),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 80,),
              Container(
                width: 160,
                height: 40,
                child: FlatButton(
                  color: Colors.white,
                    shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(10.0)),
                  textColor: Color(0xff055E98),
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.white70,
                  onPressed: () {
                    print("Pressed");
                  },
                  child: Text(
                    "Let's go!",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 160,
                height: 40,
                child: FlatButton(
                  color: Colors.white,
                  shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(10.0)),
                  textColor: Color(0xff055E98),
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.white70,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

