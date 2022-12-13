import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:flutter_dev/daejeon/mqtt/mqtt_client_connect.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class MyMqttPage extends StatefulWidget{
  MyMqttPage({Key? key,required this.title}) : super(key:key);
  final String title;
  @override
  _MyMqttPageState createState()=> _MyMqttPageState();
}
class _MyMqttPageState extends State<MyMqttPage>{
  late MqttClient client;
  var topic = 'house/light';
  // app에서 유일한 키 생성
  final _formkey= GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  //final NotificationService = ;

  @override
  void dispose(){
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _publish(String message){
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic,MqttQos.atLeastOnce,builder.payload!);
  }
  //void _subscribeToTopic(String topicName) {
  //  print('Subscribing to the $topicName topic');
  //  
  //  client.subscribe(topicName, MqttQos.atMostOnce);
  //  
  //  // print the message when it is received
  //  client.updates?.listen((List<MqttReceivedMessage<MqttMessage>>? c) {
  //    final recMess = c![0].payload as MqttPublishMessage;
  //    final message =
  //        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //    print('YOU GOT A NEW MESSAGE:');
  //    // i want to push notifation
  //    NotificationService()
  //        .showNotification(1, 'check your mailbox', 'you have new mail', 1);
  //    print(message);
  //      }
  //    );
  //  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: Column(
          //if(MqttPublishPayload.bytesToStringAsString(message.payload.message) == 'video detected!'){
          //      return const Text('성공'),
          //  }else{
          //      return cosnt Text('aaa'),
          //  },
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('connect'),
              onPressed: ()=>{
                connect().then((value){
                  client=value;
                })
              },
            ),
            ElevatedButton(
              child: Text('subscribe'),
              onPressed: (){
                client.subscribe(topic, MqttQos.atLeastOnce);
              },
            ),
            ElevatedButton(
              child: const Text('Publish'),
              onPressed: () => {this._publish('light_on')},
            ),
            ElevatedButton(
              child: const Text('Unsubscribe'),
              onPressed: () => {client.unsubscribe(topic)},
            ),
            ElevatedButton(
              child: const Text('Disconnect'),
              onPressed: () => {client.disconnect()},
            ),
            //폼에 관련된 Widget
            Form(
              key:_formkey,
              child: Column(
                children: <Widget>[//위젯리스트 전달
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),//박스 형태의 출력
                      hintText: '키',
                    ),
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if (value!.trim().isEmpty){//검증
                        return '키를 입력하시오.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(//폼간 공백을 입력
                    height:16.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '몸무게',
                    ),
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if (value!.trim().isEmpty){
                        return '몸무게를 입력하시오';
                      }
                      return null;
                    },
                  ),
                  Container(
                    margin:  const EdgeInsets.only(top: 16.0),
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: (){
                        if (_formkey.currentState!.validate()){
                          //폼에 키를 부여하고 준 validator를 한번에 검증
                          var heightTrim=
                                  double.parse(_heightController.text.trim());
                          var weightTrim=
                                  double.parse(_weightController.text.trim());
                          this._publish(
                            '{height: $heightTrim,weight:$weightTrim}'
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(//생성되는 페이질 이동
                              builder: (context)=>BmiResult(
                                heightTrim,
                                weightTrim
                                //double.parse(_heightController.text.trim()),//더블 캐스팅된 숫자
                                //double.parse(_weightController.text.trim())
                              )),
                          );
                        }
                      },
                      child: const Text('결과'),
                    ),
                  )
                ],
              ),
            )
            ],
          ),
          
        )
    );
  }
}

class BmiResult extends StatelessWidget{
  final double height;
  final double weight;
  BmiResult(this.height,this.weight);
  @override
  Widget build(BuildContext context){
    final bmi =weight/((height/100)*(height/100));
    print('bmi: $bmi');
    return Scaffold(
      appBar: AppBar(title: const Text('비만도 계산기')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _calcBmi(bmi),
              style: const TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 16,
            ),
            _buildIcon(bmi),
          ],
        ),)
    );
  }
  String _calcBmi(double bmi){
    var result ='저체중';
    if (bmi>=35){
      result='고도 비만';
    }else if(bmi>=30){
      result='2단계 비만';
    }else if(bmi>=25){
      result='1단계 비만';
    }else if(bmi>=23){
      result='과체중';
    }else if(bmi>=18.5){
      result='정상';
    }
    return result;
  }
  Widget _buildIcon(double bmi){
    if(bmi>=23){
      return const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    }else if(bmi>18.5){
      return const Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size:100
      );
    }else {
      return const Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.orange,
        size:100
      );
    }
  }
}
