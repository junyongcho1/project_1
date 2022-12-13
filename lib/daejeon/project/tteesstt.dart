import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginTest extends StatefulWidget{
  @override
  _LoginTestState createState()=> _LoginTestState();
}
class _LoginTestState extends State<LoginTest>{
  @override
  Widget build(BuildContext context){
      
      return Scaffold(
        appBar: AppBar(
          title: Text('로그인 완료!'),),
        backgroundColor: Colors.white,
        body: Center(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left:24.0,right:24.0),
            children: <Widget>[
                Text('로그인 축축축!',textAlign: TextAlign.center, //텍스트
              style:TextStyle(color: Colors.blue,
              fontSize: 35,
              fontWeight: FontWeight.bold)
              ),
              
            ],
          ),
        ),
      );  
  }
}