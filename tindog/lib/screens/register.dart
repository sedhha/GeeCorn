import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tindog/screens/PageSlidingProperty.dart';
import 'package:tindog/utilities/spinnerfile.dart';
import 'registeration.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
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
class credentials {
  final String email;
  final String pw;

  credentials(this.email, this.pw);
}
class _Register_ScreenState extends State<Register_Screen> {
  File _image;
  String str;
  String start=", ";
  String end=".,";
  String DisplayErr="";
  String EmailID="";
  String Password="";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _spinner=false;
  double widthValue=130;
  double heightvalue=130;
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
            image: AssetImage('assets/images/Bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: heightvalue,),
              Row(
                children: <Widget>[
                  SizedBox(width: widthValue,),
                  _image==null?IconButton(
                        icon: Icon(
                          Icons.camera_front,
                          size: 140,
                          color: Colors.white,),
                        onPressed: () async{
                          print("On pressed!");
                          widthValue=90;
                          heightvalue=90;
                          var image = await ImagePicker.pickImage(source: ImageSource.camera);
                          setState(() {
                            _image = image;
                          });
                        },
                      ):
                  ClipRRect(
                    borderRadius: BorderRadius.circular(120.0),
                    child: Image.file(
                      _image,
                      width: 250.0,
                      height: 250.0,
                      fit: BoxFit.fill,
                    ),
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
                    onChanged: (value){EmailID=value;},
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
                    onChanged: (value){Password=value;},
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
                  onPressed: () async{
                    setState(() {
                      _spinner=true;
                    });
                    final AuthResult user =await _auth.createUserWithEmailAndPassword(
                      email:EmailID,
                      password:Password,
                    ).catchError((onError){print(onError.toString());
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
                    if(user!=null)
                    {print("Authenticated!");
                    setState(() {
                      _spinner=false;
                    });
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context) =>Registr(
                          EmailID: EmailID,PW: Password,)));
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

