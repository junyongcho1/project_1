import 'package:flutter/material.dart';
import 'package:flutter_dev/detailview.dart';

class ListViewTest2 extends StatefulWidget{
  @override
  _State createState()=> _State();
}

class _State extends State<ListViewTest2>{
  final List<String> names =<String>['최진호씨벌련 익사시켜줄게','김예림','박수영','배주현','강슬기','손승완'];
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
                  return ListTile(
                    leading: const Icon(Icons.add),
                    title: Text('${names[index]} (${msgCount[index]})'),
                    trailing: Text('${msgCount[index]}'),
                    onTap: (){
                      var list1=ListDetail(names[index],msgCount[index]);
                      Navigator.push(
                        context,
                      MaterialPageRoute(
                        builder: ((context)=>
                        ListDetailView(listDetail:list1)
                      )));
                    },
                  );
                }))
          ],)
    );
  }
}