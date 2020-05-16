import 'package:flutter/material.dart';
class Registr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RegisterS();
  }
}

class RegisterS extends StatefulWidget {
  @override
  _RegisterSState createState() => _RegisterSState();
}

class _RegisterSState extends State<RegisterS> {
  @override
  List<Widget> RowEntries=[];
  List<Widget> ColumnEntries=[];
  bool Flag=false;
  List<Widget> ColumnEntriesWhenRow=[];
  int RowNumber=0;
  int ColumnNumber=0;
  int skillCount=0;
  String SkillEntered="";
  List<String> TextsCollected=[];
  createAlertdialog(BuildContext context)
  {
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("You can add upto maximum this much of skills."),
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
              if(skillCount>12){print("Break Operation");}
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
            SizedBox(height: 150,),
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
                children: <Widget>[],
              ),
              //color: Colors.red,
            ),
            SizedBox(height: 5,),
            StartTyping,
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
    );
  }
}
