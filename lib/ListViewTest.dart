import 'package:flutter/material.dart';

class ListViewTest extends StatefulWidget{
  @override
  _State createState()=> _State();
}

class _State extends State<ListViewTest>{
  final List<String> names =<String>['대한이','민국이','만세야','배주현','강슬기','손승완'];
  final List<int> msgCount=<int>[2,0,10,6,52,4];

  @override
  Widget build(BuildContext constext){
    return Scaffold(
      appBar:AppBar(
        title: const Text('리스트뷰 데이터 출력'),
        ),
        body:Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: names.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    height:50,
                    margin: const EdgeInsets.all(2),
                    color: msgCount[index]>=10? Colors.blue[400]:
                      msgCount[index]>3? Colors.blue[100]: Colors.grey,
                    child: Center(//출력내용을 텍스트로 표현
                      child: Text('${names[index]} (${msgCount[index]})',
                      style: const TextStyle(fontSize:18),
                      ),
                      //onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>ListDetailView()));}
                      ),
                  );
                }))
          ],)
    );
  }
}
//문제 list에잇는 데이터 짝 한 개를 넘겨서 출력하는 클래스를 만들고 메인에서 호출하면서 
//값을 넘겨 출력하시오.