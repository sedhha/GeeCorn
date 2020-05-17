import 'package:flutter/material.dart';
import 'package:tindog/screens/PageSlidingProperty.dart';
class Registr extends StatelessWidget {
  final String EmailID;
  final String PW;
  Registr({Key key, @required this.EmailID,@required this.PW}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RegisterS(emlid: EmailID,pw: PW,);
  }
}

class RegisterS extends StatefulWidget {
  String emlid;
  String pw;
  RegisterS({Key key, @required this.emlid,@required this.pw}) : super(key: key);
  @override
  _RegisterSState createState() => _RegisterSState();
}

class _RegisterSState extends State<RegisterS> {
  @override
  bool _spinner;
  List<Widget> RowEntries=[];
  List<Widget> ColumnEntries=[];
  List<Widget> RowEntries1=[];
  List<Widget> ColumnEntries1=[];
  int skillCount=0;
  int skillCount1=0;
  bool YS;
  String SkillEntered="";
  String SkillEntered1="";
  List<String> TextsCollected=[];
  List<String> TextforOther=[];
  createAlertdialog(BuildContext context)
  {
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("You can add upto maximum this much of skills. We have cleared the bottom most row. Refresh the page to re-enter!"),
      );
    });
  }
  List<Widget> AppendRows(String TextData,List<Widget> Ros)
  {
    Ros.add(Text(TextData));
    Ros.add(SizedBox(width: 5,));
    return Ros;
  }
  List<Widget> AppendColumns(int Counter,List<String> TextsCollected)
  {
    List<Widget> ColumnList=[];
    Widget RowFormation;
    List<Widget> RowWid=[];
      for(int i=0;i<Counter;i++)
      {
        //print("Modulo of ${i+1} by${3} is ${(i+1)%3}");
        if((i+1)%3==0)
      {
        RowWid.add(Container(
          height: 32,
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

            },
            child: Text(
              TextsCollected[i],
              style: TextStyle(fontSize: 14.0,),
            ),
          ),
        ),);
        //RowWid.add(Text(TextsCollected[i]));
        RowWid.add(SizedBox(width: 5,));
        RowFormation=Row(children: RowWid,);
        ColumnList.add(RowFormation);
        ColumnList.add(SizedBox(height: 3,));
        //print(ColumnList.length);
        RowWid=[];
      }
    else
      {
        RowWid.add(Container(
          height: 32,
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

            },
            child: Text(
              TextsCollected[i],
              style: TextStyle(fontSize: 14.0,),
            ),
          ),
        ),);
        RowWid.add(SizedBox(width: 5,));
      }}
      ColumnList.add(Row(children: RowWid,));
      ColumnList.add(SizedBox(height: 3,));
      return ColumnList;


  }
  Widget build(BuildContext context) {
    Widget StartTyping=Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        children: <Widget>[
          Container(
            width: 290,
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.white,
              ),
              child: TextFormField(
                onChanged: (value)
                {SkillEntered=value;},
                obscureText: false,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Start typing your skills!',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hoverColor: Color(0xff055E98),

                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Container(
            width: 50,
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
                skillCount+=1;
                if(skillCount>12){print("Break Operation");createAlertdialog(context);
                }
                else{
                  RowEntries=AppendRows(SkillEntered, RowEntries);
                  TextsCollected.add(SkillEntered);
                  //print(TextsCollected);
                  setState(() {
                    ColumnEntries=AppendColumns(skillCount,TextsCollected);
                  });
                }
              },
              child: Text(
                "Add",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),);
    Widget StartTyping2=Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        children: <Widget>[
          Container(
            width: 290,
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.white,
              ),
              child: TextFormField(
                onChanged: (value)
                {SkillEntered1=value;},
                obscureText: false,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Start typing your skills!',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hoverColor: Color(0xff055E98),

                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Container(
            width: 50,
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
                skillCount1+=1;
                if(skillCount1>12){print("Break Operation");createAlertdialog(context);
                }
                else{
                  RowEntries1=AppendRows(SkillEntered1, RowEntries1);
                  TextforOther.add(SkillEntered1);
                  //print(TextsCollected);
                  setState(() {
                    ColumnEntries1=AppendColumns(skillCount1,TextforOther);
                  });
                }
              },
              child: Text(
                "Add",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),);

    //List<Widget> RowContainer=[];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bg2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                SizedBox(width: 340,),
                Container(
                  padding: EdgeInsets.only(left: 0,top: 0,right: 10,bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,

                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.refresh,size: 40,color: Colors.white,),
                    onPressed: (){print("Hello World");
                    setState(() {
                      ColumnEntries=[];skillCount=0;RowEntries=[];TextsCollected=[];
                      ColumnEntries1=[];skillCount1=0;RowEntries1=[];TextforOther=[];
                    });},
                  ),
                ),
              ],
            ),
            SizedBox(height: 70,),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              width: double.infinity,
              height:150,
              child: Column(children: ColumnEntries,),
              //color: Colors.red,
            ),
            SizedBox(height: 5,),
            StartTyping,
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              width: double.infinity,
              height:150,
              child: Column(
                children: ColumnEntries1,
              ),
              //color: Colors.red,
            ),
            SizedBox(height: 5,),
            StartTyping2,
            SizedBox(height: 10,),
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
                    MaterialPageRoute(builder: (context) => PageSwipe()),
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
    );
  }
}
