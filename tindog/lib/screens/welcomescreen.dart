import 'package:flutter/material.dart';
import 'package:tindog/screens/PageSlidingProperty.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tindog/utilities/spinnerfile.dart';
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
  String EmailID="";
  bool _spinner;
  String str;
  String start=", ";
  String end=".,";
  String DisplayErr="";
  String Password="";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  initState() {
    super.initState();
    _spinner=false;
  }
  @override
  void dispose() {
    super.dispose();
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Wrong Credentials",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          content: Text(
            DisplayErr,
            style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return _spinner==true?scaffy:Scaffold(
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
                    onChanged: (value){
                      EmailID=value;
                    },
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
                    onChanged: (value){
                      Password=value;
                    },
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
                  onPressed: () async{
                    setState(() {
                      _spinner=true;
                    });
                    AuthResult result = await _auth.signInWithEmailAndPassword(
                        email: EmailID,
                        password: Password).catchError((onError){print(onError.toString());
                    str=onError.toString();
                    try {
                      int startIndex = str.indexOf(start);
                      int endIndex = str.indexOf(
                          end, startIndex + start.length);
                      DisplayErr=str.substring(startIndex + start.length, endIndex);
                      //print(DisplayErr);
                    }
                    catch(e)
                    {
                      DisplayErr="Unknown Error!";
                    }
                    });
                    if(result!=null)
                      {print("Authenticated!");
                      setState(() {
                        _spinner=false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageSwipe()),
                      );
                      }

                    else
                      {
                        setState(() {
                          _spinner=false;
                        });
                        _showDialog();
                      }
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

