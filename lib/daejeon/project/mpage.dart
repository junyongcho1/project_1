import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dev/daejeon/project/account.dart';

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        radius: 48.0,
        child: Image.asset('assets/home.PNG'),
      ),
    );

//이메일 입력창
    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: '이메일 입력하세오',
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
//비밀번호 입력창
    final password = TextFormField(
      controller: _passwordController,
      autofocus: false,
      //initialValue: '비밀번호를 입력하세요',
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
//로그인 버튼
    final loginButton = Padding(
        //padding : EdgeInsets.symmetric(vertical: 32.0),
        padding: EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: signIn,
          //borderRadius: BorderRadius.circular(80.0),
          //shadowColor: Colors.lightBlueAccent.shade100,
          //elevation: 10.0,
          child: MaterialButton(
            minWidth: 200.0,
            height: 48.0,
            onPressed: () {},
            color: Color(0xff1160aa),
            child: Text('로그인', style: TextStyle(color: Colors.white)),
          ),
        )
        //child: Material(
        //  borderRadius: BorderRadius.circular(80.0),
        //  shadowColor: Colors.lightBlueAccent.shade100,
        //  elevation: 10.0,
        //  child: MaterialButton(
        //    minWidth: 200.0,
        //    height: 48.0,
        //    onPressed: (){},
        //    color: Colors.lightBlueAccent,
        //    child: Text('로그인',style: TextStyle(color: Colors.white)),
        //  ),
        //),
        );

//잃어버린 아이디 찾기 버튼
    //final forgotLabel = TextButton(
    //  child: Text('Forgot Password?',style: TextStyle(color: Colors.black54),),
    //  onPressed: (){},
    //);
    final newborn = ButtonBar(
      alignment: MainAxisAlignment.center, //ButtonBar 버튼들이 중앙으로 이동
      buttonPadding: EdgeInsets.all(20), // 버튼들의 패딩값을 주기
      children: [
        TextButton(
            child: const Text('회원가입',
                style: TextStyle(color: Color.fromARGB(214, 0, 0, 0))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountPage()));
            }),
        TextButton(
            onPressed: () {},
            child: Text('비밀번호 찾기',
                style: TextStyle(color: Color.fromARGB(214, 0, 0, 0))))
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo, //집 사진 (로고)
            SizedBox(height: 24.0), // 서로 간격 조정
            Text('우리집 수호천사',
                textAlign: TextAlign.center, //텍스트
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 24.0,
            ), // 서로 간격 조정
            email, //
            SizedBox(
              height: 8.0,
            ), // 서로 간격 조정
            password,
            SizedBox(height: 24.0), // 서로 간격 조정
            loginButton,
            //forgotLabel,
            newborn
          ],
        ),
      ),
    );
  }
}
