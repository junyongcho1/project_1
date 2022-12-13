import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Notification Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Notification Demo'),
//    );
//  }
//}

class MyPush extends StatefulWidget {
  MyPush({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyPushState createState() => _MyPushState();
}

class _MyPushState extends State<MyPush> {
  //late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  var _flutterLocalNotificationsPlugin;
  late FlutterLocalNotificationsPlugin _;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('assets/redvelvet.png');//@mipmap/ic_launcher
    //var initializationSettingsIOS = IOSInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,);//initializationSettingsIOS

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification : onSelectNotification);//onSelectNotification
  }

  Future<void> onSelectNotification(String payload) async {
    debugPrint("$payload");
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Notification Payload'),
              content: Text('Payload: $payload'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _showNotification,
              child: Text('Show Notification'),
            ),
            ElevatedButton(
              onPressed: _dailyAtTimeNotification,
              child: Text('Daily At Time Notification'),
            ),
            ElevatedButton(
              onPressed: _repeatNotification,
              child: Text('Repeat Notification'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _showNotification() async {
    var android = AndroidNotificationDetails(
        'your channel id', 'your channel name', //'your channel description'
        importance: Importance.max, priority: Priority.high);

    //var ios = IOSNotificationDetails();
    var detail = NotificationDetails(android: android,);// ios

    await _flutterLocalNotificationsPlugin.show(
      0,
      '경| 시벌 성공 |축',
      '경| 시벌 성공 존나 어렵네 |축',
      detail,
      payload: 'Hello Flutter',
    );
  }

  Future<void> _dailyAtTimeNotification() async {
    var time = Time(22, 40, 0);
    var android = AndroidNotificationDetails(
        'your channel id', 'your channel name', //'your channel description'
        importance: Importance.max, priority: Priority.high);

    //var ios = IOSNotificationDetails();
    var detail = NotificationDetails(android: android,);//ios

    await _flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      '매일 똑같은 시간의 Notification',
      '매일 똑같은 시간의 Notification 내용',
      time,
      detail,
      payload: 'Hello Flutter',
    );
  }

  Future<void> _repeatNotification() async {
    var android = AndroidNotificationDetails(
        'your channel id', 'your channel name', //'your channel description'
        importance: Importance.max, priority: Priority.high);

    //var ios = IOSNotificationDetails();
    var detail = NotificationDetails(android: android,);//ios

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      '반복 Notification',
      '반복 Notification 내용',
      RepeatInterval.everyMinute,
      detail,
      payload: 'Hello Flutter',
    );
  }
}