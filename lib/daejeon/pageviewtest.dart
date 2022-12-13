import 'package:flutter/material.dart';

class PageViewTest extends StatefulWidget{
  @override
  _MyHomePageState createState()=>_MyHomePageState();
}
class Pages extends StatelessWidget{
  final text;
  Pages({this.text});
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text,textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


//위젯이 전부 그래픽
//대화형 위젯에는 전부 controller 도 같이 학습해야함
class _MyHomePageState extends State<PageViewTest>{
  PageController controller=PageController(); // 페이지뷰를 움직이거나 새롭게 생성할 때
  List<Widget> _list=<Widget>[
    new Center(child:new Pages(text:'Page 1',)),
    new Center(child:new Pages(text:'Page 2',)),
    new Center(child:new Pages(text:'Page 3',)),
  ];
  int _curr=0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:AppBar(
        title: const Text('Pageview test'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
            'Page: ${_curr+1}/${_list.length}',
            textScaleFactor:2,
            ),
          ),
        ],
      ),
      body: PageView(
          children: _list,
          scrollDirection: Axis.horizontal,
          controller: controller,
          onPageChanged: (num){
            setState(() {
              _curr=num; 
            }
          );
        },
      ),
    floatingActionButton:Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: (){
            setState(() {
              _list.add(
                new Center(
                  child: Text('최진호 시벌련 익사시켜줄게!',
                  style: TextStyle(fontSize: 35.0))
                  ),
                  );
                }
              );
              if(_curr!=_list.length-1){
                controller.jumpToPage(_curr+ 1);//페이지 이동( 페이지 리스트의 인덱스)
              }else{
                controller.jumpToPage(0);
              }
            },
      child: const Icon(Icons.add)
        ),
        FloatingActionButton(
          onPressed: (){
            _list.removeAt(_curr);//리스트에서 제거
            setState(() {//제거하고 상황이 변화되었다고 스테이트를 세팅
              controller.jumpToPage(_curr-1);//마지막 페이지가 제거되었으므로
              }
            );
          },
          child: const Icon(Icons.delete)
          ),
        ],
      )
    );
  }
}



