//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';
//import 'package:apivideo_live_stream/apivideo_live_stream.dart';
//import 'package:video_player/video_player.dart';
//import 'package:chewie/chewie.dart';
//
//class CamPage extends StatefulWidget{
//  const CamPage({Key? key,required this.title}):super(key: key);
//
//  final String title;
//  
//  @override
//  _CamPageState createState()=> _CamPageState();
//}
//class _CamPageState extends State<CamPage>{
//
//  VideoPlayerController? _videoPlayerController;
//  ChewieController? _chewieController;
//
//  @override
//  void initState(){
//    super.initState();
//    _videoPlayerController = VideoPlayerController.network('https://www.youtube.com/watch?v=FO5ECuU1vxo');//''<-에 url입력
//    _videoPlayerController!.initialize().then((_){
//      _chewieController = ChewieController(videoPlayerController: _videoPlayerController!);
//      print('Video Player\'s Good To Go');
//      }
//    );
//  }
//
//  @override
//  void dispose(){
//    _videoPlayerController!.dispose();
//    _chewieController!.dispose();
//    super.dispose();
//  }
//  Widget build(BuildContext context){
//    
//    final texbu = ButtonBar(
//        alignment: MainAxisAlignment.center,  //ButtonBar 버튼들이 중앙으로 이동
//        buttonPadding: EdgeInsets.all(48),    // 버튼들의 패딩값을 주기
//        children: [
//          TextButton(
//              onPressed: (){},
//              child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Icon(Icons.photo_camera,color: Colors.blueAccent,size: 50,), // icon
//                        Text("캡처",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),)
//                        ],
//              ),
//            ),
//          TextButton(
//              onPressed: (){},
//              child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Icon(Icons.video_camera_front_rounded,color: Colors.blueAccent,size: 50,), // icon
//                        Text("녹화",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),)
//                        ],
//              ),
//            ),
//          TextButton(
//              onPressed: (){},
//              child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Icon(Icons.view_list,color: Colors.blueAccent,size: 50,), // icon
//                        Text("기록",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),)
//                        ],
//                      ),
//                    ),
//                  ],
//                );
//          Widget _chewieVideoPlayer(){
//            return Container(
//              child: Chewie(controller: _chewieController!),
//            );
//          }
//    return Scaffold(
//      appBar: AppBar(
//          title: Text('카메라',textAlign: TextAlign.center),),
//        backgroundColor: Colors.white,
//        body: Center(
//          child: Column(
//            children: <Widget>[
//              _chewieVideoPlayer(),
//              SizedBox(height: 24.0),
//              //Text('캡처                            녹화                            기록',textAlign: TextAlign.center, //텍스트
//              //style:TextStyle(color: Colors.black,
//              //fontSize: 10,
//              //fontWeight: FontWeight.bold)
//              //),
//              texbu,
//          ],
//        ),
//      )
//    );
//  }
//}