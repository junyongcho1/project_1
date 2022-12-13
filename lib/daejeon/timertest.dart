import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StopWatchPage extends StatefulWidget{
  const StopWatchPage({super.key});
  
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}
//새롭개 하면 그릴 때 사용
class _StopWatchPageState extends State<StopWatchPage>{
  late Timer _timer;//시간을 tick으로 구동하는 객체
  var _time =0;
  var _isRunning =false;
  final List<String> _lapTimes =[];
  @override
  void dispose(){
    _timer.cancel();// 중지 - 시스템객체
    super.dispose();
  }

  Widget build(BuildContext context){// 상위 화면애ㅔ 대한 정보
    return Scaffold(
      appBar:AppBar(
        title: Text('StopWatch'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 5.0,
        ),
      ),
      //이벤트는 함수와 연결, 보통인경우는 객체 Enum변수( 범주형 ,선택)
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> setState((){// onPressed에 넘어가는
          _clickButton();
        }
      ),
        child: _isRunning ? Icon(Icons.pause): Icon(Icons.play_arrow),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

Widget _buildBody(){
  var sec= _time ~/ 100;
  var hundredth ='${_time % 100}'.padLeft(2,'0');
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top:30),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '$sec',
                style: TextStyle(fontSize: 50.0),
              ),
              Text('$hundredth'),
            ],
          ),
          Container(
            //리스트 출력구간
            width: 100,
            height: 200,
            child: ListView(
              //map함수형 프로그래밍
              children: _lapTimes.map((time)=> Text(time)).toList(),
            ),
          )
            ],
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: _reset,
              child: Icon(Icons.rotate_left),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: ElevatedButton(
              onPressed: (){ //onPressed에 연결되는 것은 positioned함수
                setState(() {
                  _recordLapTime('$sec.$hundredth');
                });
              },
              child: Text('랩타임'),
            ),
          ),
        ],
      ),
    ),
  );
}


void _clickButton(){
  _isRunning = !_isRunning;// on/off버튼
  if (_isRunning){
    _start();
  }else{
    _pause();
  }
}

void _start(){
  //   1/1000초 1/100 초마다 신호 발생 "tick이 발생"
  // 주기적으로 신호 발생
  _timer = Timer.periodic(Duration(milliseconds: 10),(timer) {
    setState(() { _time++; }); //초당 100번 실행
  });
}
void _pause() {_timer.cancel();}

void _reset(){
  setState((){
    _isRunning=false;
    _timer.cancel(); // 중지
    _lapTimes.clear();//리스트가 삭제
    _time=0;
  });
}

void _recordLapTime(String time){
  _lapTimes.insert(0,'${_lapTimes.length +1}등 $time');
}
}