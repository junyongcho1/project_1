import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountPage extends StatefulWidget{
  @override
  _AccountPageState createState()=> _AccountPageState();
}
class _AccountPageState extends State<AccountPage>{
  @override
  Widget build(BuildContext context){
    
    final name = TextFormField(
        keyboardType: TextInputType.name,
        autofocus: false,
        initialValue: '성명',
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
          )
        ),
      );

      final email1 = TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        initialValue: '이메일',
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
          )
        ),
      );

      final pw1 = TextFormField(
        autofocus: false,
        initialValue: '비밀번호',
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
          )
        ),
      );

      final pw2 = TextFormField(
        autofocus: false,
        initialValue: '비밀번호 확인',
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
          )
        ),
      );

      final newaccountButton = Padding(
        //padding : EdgeInsets.symmetric(vertical: 32.0),
        padding : EdgeInsets.all(20.0),
        child: Material(
          borderRadius: BorderRadius.circular(80.0),
          shadowColor: Colors.lightBlueAccent.shade100,
          elevation: 10.0,
          child: MaterialButton(
            minWidth: 200.0,
            height: 48.0,
            onPressed: (){},
            color: Colors.lightBlueAccent,
            child: Text('가입하기',style: TextStyle(color: Colors.white)),
          ),
        ),
      );
      
      return Scaffold(
        appBar: AppBar(
          title: Text('로그인 안료'),),
        backgroundColor: Colors.white,
        body: Center(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left:24.0,right:24.0),
            children: <Widget>[
                Text('회원가입',textAlign: TextAlign.center, //텍스트
              style:TextStyle(color: Colors.blue,
              fontSize: 35,
              fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 24.0,),
              Text('계정 생성',textAlign: TextAlign.center, //텍스트
              style:TextStyle(color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10.0,),
              name,
              SizedBox(height: 10.0,),
              email1,
              SizedBox(height: 10.0,),
              pw1,
              SizedBox(height: 10.0,),
              pw2,
              SizedBox(height: 30.0,),
              newaccountButton
            ],
          ),
        ),
      );  
  }
}
