import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dev/ListViewTest.dart';
import 'package:flutter_dev/ListViewTest2.dart';
import 'package:flutter_dev/daejeon/imageanimation.dart';
import 'package:flutter_dev/daejeon/timertest.dart';
import 'package:flutter_dev/provider/pageData.dart';
import 'package:flutter_dev/scrollingtest.dart';
import 'package:flutter_dev/daejeon/chart_flutter_test.dart';
import 'package:flutter_dev/daejeon/pageviewtest.dart';
import 'package:flutter_dev/daejeon/textfield_listview.dart';
import 'package:flutter_dev/daejeon/mqtt/mqtt_client_widget.dart';
import 'package:flutter_dev/daejeon/imageanimation.dart';
import 'package:flutter_dev/gameplay.dart';
import 'package:flutter_dev/tabviewtest/tabviewtest.dart';
import 'package:flutter_dev/daejeon/project/mpage.dart';
import 'package:flutter_dev/daejeon/project/account.dart';
import 'package:flutter_dev/daejeon/project/cam.dart';
import 'package:flutter_dev/daejeon/mqtt/push.dart';
import 'package:flutter_dev/daejeon/homepage/loding.dart';

//import 'package:flutter_dev/screen/currencyExchange/screen_currencyexchange.dart';
import 'package:flutter_dev/tabviewtest/main1.dart';
//import 'package:flutter_dev/provider/pageData.dart';
//---------------------------------------------
//material 방식으로 디자인( 안드로이드풍으로 설계된 ㅈ디자인)

//문제: 새로운 페이지를 만들고 메인에서 넘어오는 1인분의 이름 국,영,수 점수를
//받아서 이름과 합계를 출력하는 새로운 페이지를 만들고 다시 메인으로 복귀하도록 프로그램 작성
void main() {
  //final person=Person('배주현',31);
  //runApp(SecondPage(person: person));//인스턴스해서 전달
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //인터페이스는 stateless,statefulWidget둘중 하나로 생성
  const MyApp({super.key}); //생성자 호출:statelessWidget의 키를 전달

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //화면에 출력:BUildContext 시스템에서 전달되는 상항
    return MaterialApp(
      //디자인을 선택한 것을 리턴
      routes: {
        // '/detailview':(context)=>ListDetailView(),
        // '/loginview':(context)=> LoginView(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //state를 갖고있음 ,즉 변수를 갖고있음
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override //재정의 해 놓으면 lifecycle엥 ㅢ해서 자동으로 호출
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //state 클래스를 상속받음
  int _counter = 0; //상태변수

  void _incrementCounter() {
    setState(() {
      //_counter
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //화면에서 가벽(widget에서 품고있는 하나의 바운더리)
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title), //this는 자식, 부모를 widget으로 지정
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        //위치를 나타내는 widget
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0, //열로 데이터를 배치하는 위젯
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //정렬애 대한 키
          children: <Widget>[
            //리스트에 있는 객체는 다 위젯
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
//------------------------------------------------------------------------//
            ElevatedButton(
                child: Text('다음페이지'),
                onPressed: () async {
                  final person = Person('배주현', 31);
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(person: person)));
                  debugPrint('data: $result');
                }),
//------------------------------------------------------------------------//
            ElevatedButton(
              child: const Text('텍스트입력'),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCustomForm()));
              },
            ),
//----------------------------------------------------------------------//
            ElevatedButton(
              child: const Text('성적출력'),
              onPressed: () {
                final student =
                    Student(100, 100, 100, '배주현'); //DB접소ㄱ, 로컬db에서 데이터 로딩
                Navigator.push(
                    //pushNamed(context,'/detailview')
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentPage(student: student)));
              },
            ),
//---------------------------------------------------------------------------//
            ElevatedButton(
                child: const Text('리스트뷰 출력'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListViewTest2()));
                }), //ListViewTest2
//---------------------------------------------------------------------------//
            ElevatedButton(
                child: const Text('스크롤뷰 출력'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyScrollableWidget()));
                }),
//-------------------------------------------------------------------------//
            ElevatedButton(
              child: const Text('그래프출력'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SimpleBarChart.withsampleData()));
              },
            ),
//-------------------------------------------------------------------------//
            ElevatedButton(
              child: const Text('백있는그래프출력'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChartWrapper()));
              },
            ),
//--------------------------------------------------------------------------
            ElevatedButton(
              child: const Text('페이지뷰'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageViewTest()));
              },
            ),
//----------------------------------------------------------------------------
            ElevatedButton(
              child: const Text('데이터 입출력'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DataManager()));
              },
            ),
//----------------------------------------------------------------------
            ElevatedButton(
              child: const Text('MQTT통신'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyMqttPage(title: 'MQTT통신')));
              },
            ),
//---------------------------------------------------------------------------
            ElevatedButton(
              child: const Text('Timer'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StopWatchPage()));
              },
            ),
//----------------------------------------------------------------------
            ElevatedButton(
              child: const Text('이미지출력'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimatedContainerPage()));
              },
            ),
//----------------------------------------------------------------------
            ElevatedButton(
              child: const Text('dino game'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GamePlayPage()));
              },
            ),
//----------------------------------------------------------------------
            ElevatedButton(
              child: const Text('Tabbar'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabPage()));
              },
            ),
//----------------------------------------------------------------------
            ElevatedButton(
                child: const Text('환율'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp1()));
                }),
//----------------------------------------------------------------------
            ElevatedButton(
                child: const Text('login'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage1()));
                }),
//----------------------------------------------------------------------
            ElevatedButton(
                child: const Text('회원가입'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountPage()));
                }),
//----------------------------------------------------------------------
            //      ElevatedButton(
            //          child: const Text('카메라'),
            //          onPressed: (){
            //          Navigator.push(
            //            context,
            //            MaterialPageRoute(
            //              builder: (context) => CamPage()
            //            )
            //          );
            //        }
            //      ),
//----------------------------------------------------------------------
            ElevatedButton(
                child: const Text('push'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPush()));
                }),
//----------------------------------------------------------------------
            ElevatedButton(
                child: const Text('weather'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loding()));
                }),
//----------------------------------------------------------------------
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add_alarm),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 100.0,
          child: Row(children: <Widget>[
            const Text('미래융합학원  '),
            const Text('대전시'),
            const Icon(Icons.home),
            IconButton(
                icon: const Icon(Icons.add_box),
                onPressed: () {
                  debugPrint('아이콘 버튼이 눌렸습니다.');
                })
          ]),
        ),
        color: Colors.orangeAccent,
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          icon: Icon(Icons.account_box),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: null,
        ),
        //Icons는 Enum변수 Icon widget이고
      ],
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

//dynamic
class SecondPage extends StatelessWidget {
  //다시 그리는게 없다(state가 없음)
  final Person person;
  SecondPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(
        appBar: AppBar(
          title: Text(person.name),
        ),
        body: ElevatedButton(
          child: const Text('이전 페이지로'),
          onPressed: () {
            Navigator.pop(context, 'ok');
          },
        ));
  }
}

//class TextFeildTest extend StatefulWidget{
//  @override
//  Widget build(BuildContext context){
//    return MaterialApp(
//      title:'Retrive Text Input',
//      home: MyCustomForm(),
//    );
//  }
//}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() {
    return _MyCustomFormState();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  final mycontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    mycontroller.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    mycontroller.dispose(); //반드시 해제시켜야함
    super.dispose();
  }

  void _printLatestValue() {
    print('second text field: ${mycontroller.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //가벽을세우고
      appBar: AppBar(
        title: const Text('Retrive Text Input'),
      ),
      body: Padding(
          //띄어쓰기
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            TextField(
              style: const TextStyle(fontSize: 18),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  hintText: '메일주소를 입력'),
              onChanged: (text) {
                debugPrint('First text field: $text');
              },
            ),
            TextField(
              controller: mycontroller,
            )
          ])),
    );
  }

  void debugPrint(String s) {}
}

class Student {
  var kor;
  var eng;
  var mat;
  String name;
  Student(this.kor, this.eng, this.mat, this.name);
}

class StudentPage extends StatelessWidget {
  final Student student;
  StudentPage({Key? key, required this.student}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //화면출력용
    return Scaffold(
      appBar: AppBar(
        title: Text('성적확인'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('이름: ${student.name}'), //클래스 속성을 외부에서 참조할떄 $붙이면 안됨
          Text('국어: ${student.kor}'),
          Text('영어: ${student.eng}'),
          Text('수학: ${student.mat}'),
          ElevatedButton(
            child: const Text('이전페이지'),
            onPressed: () {
              Navigator.pop(context, 'ok');
            },
          ),
        ],
      )),
    );
  }
}
