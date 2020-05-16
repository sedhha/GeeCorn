import 'package:flutter/material.dart';
import 'registeration.dart';
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Register_Screen();
  }
}
class Register_Screen extends StatefulWidget {
  @override
  _Register_ScreenState createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 130,),
              Row(
                children: <Widget>[
                  SizedBox(width: 130,),
                  IconButton(
                        icon: Icon(
                          Icons.camera_front,
                          size: 140,
                          color: Colors.white,),
                        onPressed: (){
                          print("On pressed!");
                        },
                      ),
                ],
              ),
              SizedBox(height: 100,),
              Container(
                width: 300,
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                    primaryColorDark: Colors.white,
                  ),
                  child: TextFormField(
                    obscureText: false,
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
              SizedBox(height:20,),
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
              SizedBox(height:40,),
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
                      MaterialPageRoute(builder: (context) => Registr()),
                    );
                  },
                  child: Text(
                    "Next",
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

