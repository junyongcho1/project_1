import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';


Future<MqttClient> connect() async{
  MqttServerClient client=
  MqttServerClient.withPort('34.64.188.207','ayWebSocketClient_123456_33f7423c-a3b7-46b1-8a1a-26937e4a071f',19883);
  client.logging(on:true);
  client.onConnected=onConncted;
  client.onDisconnected=onDisconnected;
  client.keepAlivePeriod=20;
  //client.onUnsubscribed=onUnsubscribed;
  client.onSubscribed=onSubscribed;
  client.port=19883;
  client.onSubscribeFail=onSubscribeFail;
  client.pongCallback=pong;

final connMess= MqttConnectMessage()
  .withClientIdentifier('ayWebSocketClient_123456_33f7423c-a3b7-46b1-8a1a-26937e4a071f')
  .authenticateAs('testamin','wnsdyd0522')
  //.keepAliveFor(60)
  .withWillTopic('willtopic')
  .withWillMessage('My Will message')
  .startClean()
  .withWillQos(MqttQos.atLeastOnce);

client.connectionMessage=connMess;
try{
  print('Connecting');
  await client.connect('testamin','wnsdyd0522');
}catch(e){
  print('exception: $e');
  client.disconnect();
}

if (client.connectionStatus!.state == MqttConnectionState.connected){
  print('EMQX client connected');
  print('접속완료');
  const topic='house/video';
  client.subscribe(topic, MqttQos.atLeastOnce);
  client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
    //final MqttMessage message=c[0].payload;
    //final payload=
    //MqttPublishPayload.bytesToStringAsString(message.toString());
    print('Recived message: from topic: ${c[0].topic}>');//${c[0].topic}
  });
  client.published?.listen((MqttPublishMessage message){
    print('published');
  final payload=
        MqttPublishPayload.bytesToStringAsString(message.payload.message);
    print(
      'Published message: $payload to topic: ${message.variableHeader?.topicName}');
  });
}else {
    print(
      'EMQX client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }
    return client;
}
void onConncted() {print('Connected');}
void onDisconnected() {print('Disconnected');}
void onSubscribed(String topic) { print('Subscribe topic: $topic');}
void onSubscribeFail(String topic) { print('Falied to subscribe topic: $topic');}
void onUnsubscribed(String topic) { print('Unsubscribed topic: $topic');}
void pong() { print('Ping reponse client callback invoked');}