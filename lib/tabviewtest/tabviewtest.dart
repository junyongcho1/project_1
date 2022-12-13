import 'package:flutter/material.dart';
import 'package:flutter_dev/tabviewtest/main1.dart';
//StatefullWidget으로 할 때 with AutomaticKeepAliveClientMixin<TabVIew>
//탭을 이동할 때 위젯이 이동하니까 전의 tab의 state가 초기화
// Mixin을 사용하면 State를 저장해 주어서 항상 마지막상태로 작업이 가능
class TabPage extends StatelessWidget{
  const TabPage({super.key});
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab'),
          actions: <Widget>[
            IconButton(
              onPressed: (){
                print('tab test');
              },
              icon: Image.asset('assets/redvelvet.png'),
              ),
          ],
          bottom: TabBar( // SilverAppBar : 탭내용도 스크롤
            isScrollable: true,
            indicator: BoxDecoration(              
              borderRadius: BorderRadius.circular(50),//creates border
              color: Colors.greenAccent,
              image: const DecorationImage(
                image: AssetImage('assets/redvelvet.png'),
                fit: BoxFit.fitWidth)
                ),
            
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.tag_faces)),
              Tab(text: '메뉴2'),
              Tab(icon: Icon(Icons.info), text: '메뉴3'),
              Tab(icon: Icon(Icons.account_balance), text: '메뉴4'),
              Tab(icon: Icon(Icons.access_alarm_sharp), text: '메뉴5'),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.orange,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.black
          ),
          Container(
            color: Colors.cyan
          ),
        ]),
      ),
    );
  }
}